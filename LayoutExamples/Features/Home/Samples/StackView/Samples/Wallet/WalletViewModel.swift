//
//  WalletViewModel.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 05/05/24.
//

import Foundation

protocol WalletViewModelProtocol {
    func load()
}

class WalletViewModel: WalletViewModelProtocol {
    
    private var worker: WalletViewWorkerProtocol

    init(worker: WalletViewWorkerProtocol = WalletViewWorker()) {
        self.worker = worker
    }
    
    func load() {
        worker.getCards(
            success: { [weak self] response in
                print(response)
            },
            failure: { [weak self] error in
                print(error)
            }
        )
    }
}
