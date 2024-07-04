//
//  GridCollectionController.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 03/07/24.
//

import UIKit

class GridCollectionController<Item: GridLayoutItem>: UIViewController {
    
    // MARK: - Public Properties
    
    var contentView: (any GridCollectionViewProtocol<Item>)?
    
    // MARK: - Private Properties
    
    private var viewModel: (any GridCollectionViewModelProtocol<Item>)?
    
    // MARK: - Init
    
    init(
        viewModel: any GridCollectionViewModelProtocol<Item>,
        contentView: any GridCollectionViewProtocol<Item>,
        title: String? = nil
    ) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.contentView = contentView
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Life Cycle
    
    override func loadView() {
        super.loadView()
        self.view = contentView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setDefaultAppearance()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.resetNavigationAppearance()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() {
        contentView?.bindIn(items: viewModel?.items ?? [])
    }
}
