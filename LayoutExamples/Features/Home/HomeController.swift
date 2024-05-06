//
//  HomeController.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 01/05/24.
//

import UIKit

final class HomeController: UIViewController {
    
    typealias Item = HomeModel.Item.Name
    
    // MARK: - Private properties
    
    private var contentView: (any GridCollectionViewProtocol<Item>)?
    private var viewModel: HomeViewModelProtocol?
    private weak var coordinatorDelegate: HomeCoordinatorDelegate?
    
    // MARK: - Init
    
    init(
        viewModel: HomeViewModelProtocol,
        contentView: any GridCollectionViewProtocol<Item>,
        coordinatorDelegate: HomeCoordinatorDelegate?
    ) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.contentView = contentView
        self.coordinatorDelegate = coordinatorDelegate
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Layout Samples"
        bind()
    }
    
    // MARK: - Configure
    
    private func configure() {
        contentView?.delegate = self
    }
    
    // MARK: - BindIn
    
    private func bind() {
        contentView?.bindIn(items: viewModel?.items ?? [])
    }
}

// MARK: - HomeViewDelegate

extension HomeController: GridCollectionViewDelegate {
    func didSelect(at row: Int, with item: Item) {
        coordinatorDelegate?.routeTo(item)
    }
}
