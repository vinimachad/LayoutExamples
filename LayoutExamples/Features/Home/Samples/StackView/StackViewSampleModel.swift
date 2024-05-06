//
//  StackViewSampleModel.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 05/05/24.
//

import Foundation

enum StackViewSampleModel {
    enum Item: CaseIterable, GridLayoutItem {
        case wallet
        
        var title: String {
            switch self {
            case .wallet: return "Wallet"
            }
        }
    }
}
