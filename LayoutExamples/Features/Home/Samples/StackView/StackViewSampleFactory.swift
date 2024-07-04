//
//  StackViewSampleFactory.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 05/05/24.
//

import Foundation

enum StackViewSampleFactory {
    static func create(coordinatorDelegate: StackViewSampleCoordinatorDelegate?) -> StackViewSampleController {
        return StackViewSampleController(coordinatorDelegate: coordinatorDelegate)
    }
    
    static func wallet(coordinatorDelegate: WalletControllerDelegate?) -> WalletController {
        let contentView = WalletView()
        let viewModel = WalletViewModel()
        return WalletController(viewModel: viewModel, contentView: contentView, coordinatorDelegate: coordinatorDelegate)
    }
}
