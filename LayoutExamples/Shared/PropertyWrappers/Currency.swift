//
//  Currency.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 10/05/24.
//

import Foundation

@propertyWrapper struct Currency {
    
    // MARK: - Public properties
    
    var withoutSymbol: String {
        wrappedValue.toCurrency(withSymbol: false)
    }
    
    var wrappedValue: Double {
        didSet {
            currency = wrappedValue.toCurrency()
        }
    }
    
    var projectedValue: String {
        currency
    }
    
    // MARKL - Private properties
    
    private var currency: String
    
    // MARK: - Init
    
    init(wrappedValue: Double) {
        self.currency = wrappedValue.toCurrency()
        self.wrappedValue = wrappedValue
    }
}
