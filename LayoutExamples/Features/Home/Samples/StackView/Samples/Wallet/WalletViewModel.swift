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
    
    private var dispatchGroup = DispatchGroup()
    private var worker: WalletViewWorkerProtocol
    private var homesViewModel: WalletModel.ViewModel.Home?
    private var quotesResponse: [WalletModel.Response.Quotes.Quote] = []
    
    // MARK: - Init
    
    init(worker: WalletViewWorkerProtocol = WalletViewWorker()) {
        self.worker = worker
    }
    
    // MARK: - WalletViewModelProtocol Methods
    
    func load() {
        onUpdateViewStateWith?(.loading)
        getHomesRequest()
        getQuoteRequest()
        
        dispatchGroup.notify(queue: .main) {
            guard var viewModel = self.homesViewModel else { return }
            viewModel.quotes = self.quotesResponse
            self.onUpdateViewStateWith?(.present(viewModel))
        }
    }
    
    // MARK: - Requests Methods
    
    private func getQuoteRequest() {
        dispatchGroup.enter()
        worker.getQuotes(coins: "USD-BRL,EUR-BRL,GBP-BRL", completion: .init(
            success: { [weak self] response in
                self?.quotesResponse = response.quotes
            },
            failure: { error in
                print(error)
            },
            finally: { self.dispatchGroup.leave() }
        ))
    }
    
    private func getHomesRequest() {
        dispatchGroup.enter()
        worker.getHomes(completion: .init(
            success: { [weak self] response in
                self?.homesViewModel = WalletModel.ViewModel.Home(
                    firstName: response.account.firstName,
                    avatarImage: response.account.avatarImage,
                    balance: response.checkingAccount.balance,
                    cards: response.cards
                )
            },
            failure: { error in
                print(error)
            },
            finally: { self.dispatchGroup.leave() }
        ))
    }
}
