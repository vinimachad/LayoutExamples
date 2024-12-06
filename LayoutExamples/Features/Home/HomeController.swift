//
//  HomeController.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 01/05/24.
//

import UIKit

final class HomeController: GridCollectionController<HomeModel.Item.Name> {
    
    // MARK: - Private properties
    
    private weak var coordinatorDelegate: HomeCoordinatorDelegate?
    
    // MARK: - Init
    
    init(coordinatorDelegate: HomeCoordinatorDelegate?) {
        super.init(viewModel: GridCollectionViewModel(), contentView: GridCollectionView(), title: "Layout Samples")
        self.coordinatorDelegate = coordinatorDelegate
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    // MARK: - Configure
    
    private func configure() {
        contentView?.delegate = self
    }
}

// MARK: - HomeViewDelegate

extension HomeController: GridCollectionViewDelegate {
    func didSelect(at row: Int, with item: HomeModel.Item.Name) {
        coordinatorDelegate?.routeTo(item)
    }
}
