//
//  AppStoreViewModel.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 03/07/24.
//

import Foundation

protocol AppStoreViewModelProtocol {
    var onChangeSections: Completion<[AppStoreModels.Section]>? { get set }
    func loadApps()
}

class AppStoreViewModel: AppStoreViewModelProtocol {
    
    // MARK: - Public Properties
    
    var onChangeSections: Completion<[AppStoreModels.Section]>?
    
    // MARK: - Private Properties
    
    private var worker: AppStoreWorkerProtocol
    
    // MARK: - Init
    
    init(worker: AppStoreWorkerProtocol = AppStoreWorker()) {
        self.worker = worker
    }
    
    func loadApps() {
        worker.getApps(completion: .init(
            success: { sections in
                self.onChangeSections?(sections)
            },
            failure: { error in
                print(error)
            },
            finally: { }
        ))
    }
}
