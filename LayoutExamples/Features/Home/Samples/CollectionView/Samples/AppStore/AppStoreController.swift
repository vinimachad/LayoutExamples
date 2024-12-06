//
//  AppStoreController.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 03/07/24.
//

import UIKit

protocol AppStoreCoordinatorDelegate: AnyObject {
    
}

class AppStoreController: UIViewController {
    
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    
    private var contentView: AppStoreView?
    private var viewModel: AppStoreViewModelProtocol?
    private weak var coordinatorDelegate: AppStoreCoordinatorDelegate?
    
    // MARK: - Init
    
    init(viewModel: AppStoreViewModelProtocol, contentView: AppStoreView, coordinatorDelegate: AppStoreCoordinatorDelegate?) {
        self.viewModel = viewModel
        self.coordinatorDelegate = coordinatorDelegate
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel?.loadApps()
    }
    
    private func bind() {
        viewModel?.onChangeSections = { sections in
            self.contentView?.bind(sections: sections)
        }
    }
}
