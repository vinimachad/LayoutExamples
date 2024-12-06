//
//  StackViewSampleController.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 03/05/24.
//

import UIKit

protocol StackViewSampleCoordinatorDelegate: AnyObject, CoordinatorDelegate {
    func routeTo(_ destination: StackViewSampleModel.Item)
}

final class StackViewSampleController: GridCollectionController<StackViewSampleModel.Item> {
    
    // MARK: - Private properties
    
    private weak var coordinatorDelegate: StackViewSampleCoordinatorDelegate?
    
    // MARK: - Init
    
    init(coordinatorDelegate: StackViewSampleCoordinatorDelegate?) {
        super.init(viewModel: GridCollectionViewModel(), contentView: GridCollectionView(), title: "Stack View Samples")
        self.coordinatorDelegate = coordinatorDelegate
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    // MARK: - Life cycle
    
    private func configure() {
        contentView?.delegate = self
    }
}

// MARK: - GridCollectionViewDelegate

extension StackViewSampleController: GridCollectionViewDelegate {
    func didSelect(at row: Int, with item: StackViewSampleModel.Item) {
        coordinatorDelegate?.routeTo(item)
    }
}
