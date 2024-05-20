//
//  WalletViewModel.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 05/05/24.
//

import Foundation

protocol WalletViewModelProtocol {
    var onUpdateViewStateWith: Completion<WalletView.State>? { get set }
    func load()
}

class WalletViewModel: WalletViewModelProtocol {
    
    // MARK: - Public properties
    
    var onUpdateViewStateWith: Completion<WalletView.State>?
    
    // MARK: - Private properties
    
    private var worker: WalletViewWorkerProtocol
    
    // MARK: - Init
    
    init(worker: WalletViewWorkerProtocol = WalletViewWorker()) {
        self.worker = worker
    }
    
    // MARK: - WalletViewModelProtocol Methods
    
    func load() {
        onUpdateViewStateWith?(.loading)
        worker.getHomes(
            success: { [weak self] response in
                let homesViewModel = WalletModel.ViewModel.Home(
                    firstName: response.account.firstName,
                    avatarImage: response.account.avatarImage,
                    balance: response.checkingAccount.balance,
                    quotes: response.quotes,
                    cards: response.cards
                )
                self?.onUpdateViewStateWith?(.present(homesViewModel))
            },
            failure: { [weak self] error in
                self?.onUpdateViewStateWith?(.error)
            },
            finally: nil
        )
    }
}
