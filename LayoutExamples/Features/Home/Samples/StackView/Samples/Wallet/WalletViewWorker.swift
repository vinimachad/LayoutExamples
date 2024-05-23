//
//  WalletViewWorker.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 09/05/24.
//

import Foundation

protocol WalletViewWorkerProtocol {
    func getQuotes(coins: String, completion: AsyncResultHandler<WalletModel.Response.Quotes>)
    func getHomes(
        success: @escaping Completion<WalletModel.Response.Home>,
        failure: @escaping Completion<AppError>,
        finally: EmptyCompletion?
    )
}

class WalletViewWorker: WalletViewWorkerProtocol {
    typealias Response = WalletModel.Response
    
    // MARK: - Private properties
    
    private var apiService: APIServiceProtocol
    private var bundleService: BundleServiceProtocol
    
    // MARK: - Init
    
    init(bundleService: BundleServiceProtocol = BundleService.shared, apiService: APIServiceProtocol = APIService.shared) {
        self.apiService = apiService
        self.bundleService = bundleService
    }
    
    // MARK: - WalletViewWorkerProtocol
    
    func getHomes(
        success: @escaping Completion<Response.Home>,
        failure: @escaping Completion<AppError>,
        finally: EmptyCompletion?
    ) {
        bundleService.loadJson(
            "WalletHomesMock",
            model: Response.Home.self,
            completion: { result in
                switch result {
                case .success(let response):
                    success(response)
                case .failure(let error):
                    failure(error)
                }
                finally?()
            })
    }
    
    func getQuotes(coins: String, completion: AsyncResultHandler<WalletModel.Response.Quotes>) {
        let provider = GetQuotesProvider(coins: coins)
        apiService.fetch(Response.Quotes.self, provider: provider, completion: { result in
            switch result {
            case .success(let response):
                completion.success?(response)
            case .failure(let error):
                completion.failure?(error)
            }
            completion.finally?()
        })
    }
}
