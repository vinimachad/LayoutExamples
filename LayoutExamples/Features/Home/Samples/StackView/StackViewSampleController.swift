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

final class StackViewSampleController: UIViewController {
    
    typealias Item = StackViewSampleModel.Item
    
    // MARK: - Private properties
    
    private var contentView: (any GridCollectionViewProtocol<Item>)?
    private var viewModel: StackViewSampleViewModelProtocol?
    private weak var coordinatorDelegate: StackViewSampleCoordinatorDelegate?
    
    // MARK: - Init
    
    init(
        viewModel: StackViewSampleViewModelProtocol,
        contentView: any GridCollectionViewProtocol<Item>,
        coordinatorDelegate: StackViewSampleCoordinatorDelegate?
        
    ) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.contentView = contentView
        self.coordinatorDelegate = coordinatorDelegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        super.loadView()
        self.view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Stack View Samples"
        configure()
        bind()
    }
    
    private func configure() {
        contentView?.delegate = self
    }
    
    private func bind() {
        contentView?.bindIn(items: viewModel?.items ?? [])
    }
}

// MARK: - GridCollectionViewDelegate

extension StackViewSampleController: GridCollectionViewDelegate {
    func didSelect(at row: Int, with item: StackViewSampleModel.Item) {
        coordinatorDelegate?.routeTo(item)
    }
}
