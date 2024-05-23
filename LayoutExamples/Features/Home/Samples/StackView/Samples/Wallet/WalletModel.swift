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
        }
        
        struct Quotes: Decodable {
            
            var quotes: [Quote]
            
            struct Quote: Decodable {
                var coin: String
                var value: String
                
                enum CodingKeys: String, CodingKey {
                    case coin = "code"
                    case value = "high"
                }
            }
            
            init(from decoder: any Decoder) throws {
                let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
                
                var quotesArray = [Quote]()
                for key in container.allKeys {
                    let nestedContainer = try container.nestedContainer(keyedBy: Quote.CodingKeys.self, forKey: key)
                    let coin = try nestedContainer.decode(String.self, forKey: .coin)
                    let value = try nestedContainer.decode(String.self, forKey: .value)
                    let quote = Quote(coin: coin, value: value)
                    quotesArray.append(quote)
                }
                
                self.quotes = quotesArray
            }
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
            var ownerName: String
            
            var lastDigits: String {
                let digits = number.suffix(4)
                return String(repeating: "*", count: number.count - 4) + digits
            }
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
            var quotes: [Response.Quotes.Quote] = []
            var cards: [Response.Card]
        }
    }
    
}

private struct DynamicCodingKeys: CodingKey {
    var intValue: Int?
    var stringValue: String
    
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
                    
    init?(intValue: Int) {
        return nil
    }
}
