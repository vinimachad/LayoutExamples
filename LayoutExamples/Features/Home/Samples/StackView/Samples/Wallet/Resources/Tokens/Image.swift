//
//  Image.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 07/05/24.
//

import Foundation

enum WalletImageLiterals: String, ImageTokenProtocol  {
    case menu
    case scan
    case add
    case more
    case elo
    case visa
    case mastercard
    case avatarPlaceholder = "avatar_placeholder"
    
    // MARK: - ImageTokenProtocol implementation
    
    var name: String {
        "StackView/Wallet/Icons/\(self.rawValue)"
    }
}
