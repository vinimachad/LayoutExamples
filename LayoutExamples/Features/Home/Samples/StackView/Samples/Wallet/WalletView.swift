//
//  WalletView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 05/05/24.
//

import UIKit

protocol WalletViewProtocol: UIScrollView { }

class WalletView: ScrollView<VerticalStackView>, WalletViewProtocol {
    
    // MARK: - UI Components

    private lazy var headerView: WalletHeaderView = WalletHeaderView()
    private lazy var balanceView: WalletBalanceView = WalletBalanceView()
    private lazy var cardView: WalletCardsView = WalletCardsView()
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
    
    // MARK: - Configure
    
    override func configure() {
        super.configure()
        backgroundColor = .init(literal: WalletColorLiterals.primary)
        containerView.spacing = 16
        containerView.backgroundColor = .clear
        containerView.layoutMargins = .init(edges: 16)
    }
    
    // MARK: - Hierarchy
    
    override func configureHierarchy() {
        super.configureHierarchy()
        containerView.addArrangedSubviews([
            headerView,
            balanceView,
            cardView,
            quoteView,
            menuView
        ])
    }
}
