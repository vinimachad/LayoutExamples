//
//  StackViewSampleViewModel.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 05/05/24.
//

import Foundation

protocol StackViewSampleViewModelProtocol {
    var items: [StackViewSampleModel.Item] { get }
}

final class StackViewSampleViewModel: StackViewSampleViewModelProtocol {
    var items: [StackViewSampleModel.Item] {
        StackViewSampleModel.Item.allCases
    }
}
