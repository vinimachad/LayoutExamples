//
//  WalletViewWorker.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 09/05/24.
//

import Foundation

protocol WalletViewWorkerProtocol {
    func getHomes(
        success: @escaping Completion<WalletModel.Response.Home>,
        failure: @escaping Completion<AppError>,
        finally: EmptyCompletion?
    )
}

class WalletViewWorker: WalletViewWorkerProtocol {
    typealias Response = WalletModel.Response
    
    // MARK: - Private properties
    
    private var service: BundleServiceProtocol
    
    // MARK: - Init
    
    init(service: BundleServiceProtocol = BundleService.shared) {
        self.service = service
    }
    
    // MARK: - WalletViewWorkerProtocol
    
    func getHomes(
        success: @escaping Completion<Response.Home>,
        failure: @escaping Completion<AppError>,
        finally: EmptyCompletion?
    ) {
        service.loadJson(
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
}
