//
//  WalletModel.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 05/05/24.
//

import Foundation

enum WalletModel {
    
    enum Response {
        struct Home: Decodable {
            var checkingAccount: CheckingAccount
            var account: Account
            var cards: [Card]
            var quotes: [Quote]
        }
        
        struct Quote: Decodable {
            var coin: String
            var value: Double
        }
        
        struct Account: Decodable {
            var fullName: String
            var firstName: String
            var avatarImage: String
        }
        
        struct Card: Decodable {
            var logo: String
            var dueDate: Date
            var invoiceValue: Double
            var number: String
        }
        
        struct CheckingAccount: Decodable {
            var balance: Double
        }
    }
    
    enum ViewModel {
        struct Home {
            var firstName: String
            var avatarImage: String
            @Currency var balance: Double
            var quotes: [Response.Quote]
            var cards: [Response.Card]
        }
    }
}
