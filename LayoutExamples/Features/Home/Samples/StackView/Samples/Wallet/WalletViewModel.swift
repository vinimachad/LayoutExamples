//
//  WalletViewModel.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 05/05/24.
//

import Foundation

protocol WalletViewModelProtocol {
    var onPresentBottomSheet: Completion<BottomSheetModel>? { get set }
    var onUpdateViewStateWith: Completion<WalletView.State>? { get set }
    func load()
    func didPresentBottomSheet()
}

class WalletViewModel: WalletViewModelProtocol {
    
    // MARK: - Public properties
    
    var onPresentBottomSheet: Completion<BottomSheetModel>?
    var onUpdateViewStateWith: Completion<WalletView.State>?
    
    // MARK: - Private properties
    
    private var dispatchGroup = DispatchGroup()
    private var worker: WalletViewWorkerProtocol
    private var homesViewModel: WalletModel.ViewModel.Home?
    private var quotesResponse: [WalletModel.Response.Quotes.Quote] = []
    
    // MARK: - Editing properties
    
    private var workingHomesViewModel: WalletModel.ViewModel.Home?
    
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
    
    func didPresentBottomSheet() {
        workingHomesViewModel = homesViewModel
        let model = BottomSheetModel(
            title: "Customizador da WalletView",
            textFields: [
                .init(name: "name", label: "User name", onTextChange: { text in
                    self.updateIfNotEmpty(text, completion: { self.workingHomesViewModel?.firstName = text })
                }),
                .init(name: "avatar_image", label: "Avatar url", keyboardType: .URL, onTextChange: { text in
                    self.updateIfNotEmpty(text, completion: { self.workingHomesViewModel?.avatarImage = text })
                }),
                .init(name: "balance", label: "Balance", keyboardType: .decimalPad, onTextChange: { text in
                    self.updateIfNotEmpty(text, completion: { self.workingHomesViewModel?.balance = Double(text) ?? 0 })
                }),
                .init(name: "cards_count", label: "Quantity cards", keyboardType: .numberPad, onTextChange: { numberOfCards in
                    self.updateIfNotEmpty(
                        numberOfCards,
                        completion: {
                            self.workingHomesViewModel?.cards = self.generateRandomCards(Int(numberOfCards) ?? 0)
                        }
                    )
                }),
                .init(name: "quotes", label: "Quotes", supportingText: "Use: USD-BRL,EUR-BRL..."),
            ],
            onDoneEditing: {
                guard let viewModel = self.workingHomesViewModel else { return }
                self.homesViewModel = viewModel
                self.onUpdateViewStateWith?(.present(viewModel))
            }
        )
        onPresentBottomSheet?(model)
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
    
    // MARK: - Private Methods
    
    private func updateIfNotEmpty(_ value: String?, completion: EmptyCompletion?) {
        guard let value, !value.isEmpty else { return }
        completion?()
    }
    
    private func generateRandomCards(_ cardsLenght: Int) -> [WalletModel.Response.Card] {
        guard cardsLenght != .zero else { return [] }
        var cards = [WalletModel.Response.Card]()
        
        for _ in 0..<cardsLenght {
            let name = "\(self.randomString(lenght: 8)) \(self.randomString(lenght: 1)) \(self.randomString(lenght: 7))"
            let cardNumber = self.randomNumber(lenght: 13)
            let invoice = Double.random(in: 0..<3000)
            let dueDate = Date().addingTimeInterval(8000)
            cards.append(.init(logo: "mastercard", dueDate: dueDate, invoiceValue: invoice, number: cardNumber, ownerName: name))
        }
        
        return cards
    }
    
    private func randomString(lenght: Int) -> String {
        let charSet = "abcdefghijklmnpqrstuvwxyz".split(separator: "")
        var string = ""
        
        for _ in 0..<lenght {
            let randomPos = Int.random(in: 0..<charSet.count)
            string += charSet[randomPos]
        }
        
        return string
    }
    
    private func randomNumber(lenght: Int) -> String {
        let charSet = "1234567890".split(separator: "")
        var string = ""
        
        for _ in 0..<lenght {
            let randomPos = Int.random(in: 0..<charSet.count)
            string += charSet[randomPos]
        }
        
        return string
    }
}
