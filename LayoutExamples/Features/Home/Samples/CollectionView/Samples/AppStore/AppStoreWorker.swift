//
//  AppStoreWorker.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 07/07/24.
//

import Foundation

protocol AppStoreWorkerProtocol {
    func getApps(completion: AsyncResultHandler<[AppStoreModels.Section]>)
}

class AppStoreWorker: AppStoreWorkerProtocol {
    
    // MARK: - Private Properties
    
    private var bundleService: BundleServiceProtocol
    
    // MARK: - Init
    
    init(bundleService: BundleServiceProtocol = BundleService()) {
        self.bundleService = bundleService
    }
    
    // MARK: - Implemented Methods
    
    func getApps(completion: AsyncResultHandler<[AppStoreModels.Section]>) {
        bundleService.loadJson(
            "AppsMock",
            model: [AppStoreModels.Section].self,
            completion: { result in
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
