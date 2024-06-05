//
//  GetQuotesProvider.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 21/05/24.
//

import Foundation

class GetQuotesProvider: APIProviderProtocol {
    
    // MARK: - Implementation Properties
    
    var path: String {
        "https://economia.awesomeapi.com.br/json/last/\(coins)"
    }
    
    // MARK: - Private Properties
    
    private var coins: String
    
    // MARK: - Init
    
    init(coins: String) {
        self.coins = coins
    }
}
