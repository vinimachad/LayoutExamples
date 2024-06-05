//
//  WalletController.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 05/05/24.
//

import UIKit

protocol WalletControllerDelegate: AnyObject {
    func presentAlert(title: String, description: String)
    #if DEBUG
    func presentBottomSheet(with model: BottomSheetModel)
    #endif
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
        bind()
        viewModel?.load()
    }
    
    // MARK: - Motion Methods
    
    #if DEBUG
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            viewModel?.didPresentBottomSheet()
        }
    }
    #endif
    
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
        
        #if DEBUG
        self.viewModel?.onPresentBottomSheet = { [weak self] model in
            self?.coordinatorDelegate?.presentBottomSheet(with: model)
        }
        #endif
    }
}

extension WalletController: WalletViewDelegate {
    func didTapMore() {
        coordinatorDelegate?.presentAlert(
            title: "Você clicou no botão de Mais",
            description: "Não temos desenvovimento da proxíma tela."
        )
    }
    
    func didTapAdd() {
        coordinatorDelegate?.presentAlert(
            title: "Você clicou no botão de Adicionar",
            description: "Não temos desenvovimento da proxíma tela."
        )
    }
    
    func didTapScan() {
        coordinatorDelegate?.presentAlert(
            title: "Você clicou no botão de Escanear",
            description: "Não temos desenvovimento da proxíma tela."
        )
    }
    
    func didTapPay() {
        coordinatorDelegate?.presentAlert(
            title: "Você clicou no botão de Pagar",
            description: "Não temos desenvovimento da proxíma tela."
        )
    }
    
    func showCardSelector() { /*Implementar no futuro*/ }
}
