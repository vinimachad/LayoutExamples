//
//  CollectionViewSamplesController.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 03/07/24.
//

import UIKit

protocol CollectionViewSamplesCoordinatorDelegate: AnyObject {
    func route(to route: CollectionViewSamplesModel.Item)
}

final class CollectionViewSamplesController: GridCollectionController<CollectionViewSamplesModel.Item> {
    
    // MARK: - Private Properties

    private weak var coordinatorDelegate: CollectionViewSamplesCoordinatorDelegate?
    
    // MARK: - Init
    
    init(coordinatorDelegate: CollectionViewSamplesCoordinatorDelegate?) {
        super.init(
            viewModel: GridCollectionViewModel(),
            contentView: GridCollectionView(),
            title: "CollectionView Samples"
        )
        self.coordinatorDelegate = coordinatorDelegate
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    // MARK: - Life Cycle
    
    private func configure() {
        contentView?.delegate = self
    }
}

// MARK: - GridCollectionViewDelegate

extension CollectionViewSamplesController: GridCollectionViewDelegate {
    func didSelect(at row: Int, with item: CollectionViewSamplesModel.Item) {
        coordinatorDelegate?.route(to: item)
    }
}
