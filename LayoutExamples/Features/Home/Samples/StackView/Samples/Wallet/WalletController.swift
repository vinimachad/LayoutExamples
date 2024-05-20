//
//  WalletController.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 05/05/24.
//

import UIKit

class WalletController: UIViewController {
    
    // MARK: - Private properties
    
    private var viewModel: WalletViewModelProtocol?
    private var contentView: WalletViewProtocol?
    
    // MARK: - Init
    
    init(viewModel: WalletViewModelProtocol, contentView: WalletViewProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.contentView = contentView
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBarAppearance()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.resetNavigationAppearance()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        bind()
        viewModel?.load()
    }
    
    // MARK: - Configure
    
    private func configure() {
        contentView?.walletDelegate = self
    }
    
    private func configureNavigationBarAppearance() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithDefaultBackground()
        navBarAppearance.backgroundEffect = UIBlurEffect(style: .light)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.setDefaultAppearance(navBarAppearance)
    }
    
    private func bind() {
        viewModel?.onUpdateViewStateWith = { [weak self] state in
            self?.contentView?.state = state
        }
    }
}

extension WalletController: WalletViewDelegate {
    func showCardSelector() {
        
    }
}
