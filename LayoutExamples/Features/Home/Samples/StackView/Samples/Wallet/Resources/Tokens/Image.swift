//
//  Image.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 07/05/24.
//

import Foundation

enum WalletImageLiterals: String, ImageTokenProtocol  {
    case menu
    
    // MARK: - ImageTokenProtocol implementation
    
    var name: String {
        "StackView/Wallet/Icons/\(self.rawValue)"
    }
}
