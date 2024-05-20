//
//  WalletView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 05/05/24.
//

import UIKit

protocol WalletViewDelegate: AnyObject {
    func showCardSelector()
}

protocol WalletViewProtocol: UIScrollView {
    var state: WalletView.State? { get set }
    var walletDelegate: WalletViewDelegate? { get set }
}

class WalletView: ScrollView<VerticalStackView>, WalletViewProtocol {
    
    enum State {
        case loading
        case present(WalletModel.ViewModel.Home)
        case error
    }
    
    // MARK: - Public properties
    
    weak var walletDelegate: WalletViewDelegate?
    var state: State? {
        didSet {
            updateViewByState()
        }
    }
    
    // MARK: - UI Components

    private lazy var headerView: WalletHeaderView = WalletHeaderView()
    private lazy var balanceView: WalletBalanceView = WalletBalanceView()
    private lazy var cardsView: WalletCardsView = WalletCardsView()
    private lazy var quoteView: WalletQuoteView = WalletQuoteView()
    private lazy var menuView: WalletMenuView = WalletMenuView()
    private lazy var containerView: VerticalStackView = VerticalStackView()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        contentView = containerView
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        contentView = containerView
    }
    
    // MARK: - Updates
    
    private func updateViewByState() {
        guard let state else { return }
        switch state {
        case .loading: break
        case .present(let viewModel):
            headerView.viewModel = (name: viewModel.firstName, viewModel.avatarImage)
        case .error: break
        }
        
    }
    
    // MARK: - Configure
    
    override func configure() {
        super.configure()
        cardsView.delegate = self
        containerView.spacing = 16
        containerView.backgroundColor = .clear
        containerView.layoutMargins = .init(edges: 16)
        containerView.setCustomSpacing(32, after: headerView)
        backgroundColor = .init(literal: WalletColorLiterals.primary)
    }
    
    // MARK: - Hierarchy
    
    override func configureHierarchy() {
        super.configureHierarchy()
        containerView.addArrangedSubviews([
            headerView,
            balanceView,
            cardsView,
            quoteView,
            menuView
        ])
    }
}

extension WalletView: WalletCardsDelegate {
    func didTapContainerCards() {
        walletDelegate?.showCardSelector()
    }
}
