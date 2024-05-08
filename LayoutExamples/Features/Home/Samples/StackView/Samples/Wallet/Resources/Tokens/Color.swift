//
//  Colors.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 07/05/24.
//

import UIKit

enum WalletColorLiterals: String, ColorTokenProtocol {
    case primary
    case red
    case blue
    case white100 = "white-100"
    case white
    
    var name: String {
        "StackView/Wallet/Colors/\(self.rawValue)"
    }
}
