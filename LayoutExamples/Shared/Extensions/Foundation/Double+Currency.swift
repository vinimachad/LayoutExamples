//
//  Double+Currency.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 10/05/24.
//

import Foundation

extension Double {
    func toCurrency(withSymbol: Bool = true) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.currencySymbol = withSymbol ? "R$" : ""
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
