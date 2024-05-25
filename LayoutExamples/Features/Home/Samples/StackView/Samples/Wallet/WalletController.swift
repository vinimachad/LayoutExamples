//
//  WalletController.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 05/05/24.
//

import UIKit

protocol WalletControllerDelegate: AnyObject {
    func presentBottomSheet()
}

class WalletController: UIViewController, NeedBlur {
    
    // MARK: - Private properties
    
    private var viewModel: WalletViewModelProtocol?
    private var contentView: WalletViewProtocol?
    private weak var coordinatorDelegate: WalletControllerDelegate?
    
    // MARK: - Init
    
    init(viewModel: WalletViewModelProtocol, contentView: WalletViewProtocol, coordinatorDelegate: WalletControllerDelegate?) {
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
        coordinatorDelegate?.presentBottomSheet()
        bind()
        viewModel?.load()
    }
    
    // MARK: - Motion Methods
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            coordinatorDelegate?.presentBottomSheet()
        }
    }
    
    // MARK: - Configure
    
    override func becomeFirstResponder() -> Bool {
        true
    }
    
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
        self.viewModel?.onUpdateViewStateWith = { [weak self] state in
            self?.contentView?.state = state
        }
    }
}

extension WalletController: WalletViewDelegate {
    func showCardSelector() {
        
    }
}
