//
//  HomeFactory.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 03/05/24.
//

import Foundation

enum HomeFactory {
    static func create(coordinatorDelegate: HomeCoordinatorDelegate?) -> HomeController {
        let viewModel = HomeViewModel()
        let contentView = GridCollectionView<HomeModel.Item.Name>()
        return HomeController(
            viewModel: viewModel,
            contentView: contentView,
            coordinatorDelegate: coordinatorDelegate
        )
    }
}
