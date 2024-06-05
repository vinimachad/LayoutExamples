//
//  WalletView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 05/05/24.
//

import UIKit

protocol WalletViewDelegate: AnyObject {
    func showCardSelector()
    func didTapMore()
    func didTapAdd()
    func didTapScan()
    func didTapPay()
}

protocol WalletViewProtocol: UIScrollView {
    var state: WalletView.State? { get set }
    var walletDelegate: WalletViewDelegate? { get set }
}

class WalletView: ScrollView<UIView>, WalletViewProtocol {
    
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
    private lazy var loadingView: WalletCardLoadingView = WalletCardLoadingView()
    private lazy var containerView: VerticalStackView = {
        let view = VerticalStackView()
        view.spacing = 16
        view.backgroundColor = .clear
        view.layoutMargins = .init(edges: 16)
        return view
    }()
    
    // MARK: - Init
    
    override init() {
        super.init()
        contentView = UIView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        contentView = UIView()
    }
    
    // MARK: - Updates
    
    private func updateViewByState() {
        guard let state else { return }
        switch state {
        case .loading:
            addSubviewAferRemoveAll(loadingView)
        case .present(let viewModel):
            headerView.viewModel = (name: viewModel.firstName, viewModel.avatarImage)
            balanceView.balance = viewModel.$balance
            cardsView.cards = viewModel.cards
            quoteView.quotes = viewModel.quotes
            setDelegates()
            configureHierarchyLoadedView()
        case .error: break
        }
    }
    
    // MARK: - Configure
    
    override func configure() {
        super.configure()
        backgroundColor = .init(literal: WalletColorLiterals.primary)
    }
    
    private func configureHierarchyLoadedView() {
        addSubviewAferRemoveAll(containerView)
        containerView.addArrangedSubviews([
            headerView,
            balanceView,
            cardsView,
            quoteView,
            menuView
        ])
        containerView.setCustomSpacing(32, after: headerView)
    }
    
    private func setDelegates() {
        headerView.delegate = self
        cardsView.delegate = self
        menuView.delegate = self
    }
    
    // MARK: - Hierarchy

    private func addSubviewAferRemoveAll(_ view: UIView) {
        contentView?.removeAllSubviews()
        contentView?.addSubview(view)
        guard let contentView else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

extension WalletView: WalletCardsDelegate, WalletHeaderViewDelegate, WalletMenuViewDelegate {
    
    func didTapContainerCards() {
        walletDelegate?.showCardSelector()
    }
    
    // MARK: - WalletHeaderViewDelegate
    
    func didTapMore() {
        walletDelegate?.didTapMore()
    }
    
    // MARK: - WalletMenuViewDelegate
    
    func didTapAdd() {
        walletDelegate?.didTapAdd()
    }
    
    func didTapScan() {
        walletDelegate?.didTapScan()
    }
    
    func didTapPay() {
        walletDelegate?.didTapPay()
    }
}
