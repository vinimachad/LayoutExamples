//
//  WalletView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 05/05/24.
//

import UIKit

protocol WalletViewProtocol: UIScrollView { }

class WalletView: UIScrollView, WalletViewProtocol, ConfigurableView {
    
    private lazy var containerView: VerticalStackView = VerticalStackView()
    private lazy var headerView: WalletHeaderView = WalletHeaderView()
    private lazy var balanceView: WalletBalanceView = WalletBalanceView()
    private lazy var cardView: WalletCardsView = WalletCardsView()
    private lazy var quoteView: WalletQuoteView = WalletQuoteView()
    private lazy var menuView: WalletMenuView = WalletMenuView()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    // MARK: - Configure
    
    func configure() {
        contentInsetAdjustmentBehavior = .never
        backgroundColor = .init(literal: WalletColorLiterals.primary)
        containerView.spacing = 16
        containerView.backgroundColor = .clear
        containerView.layoutMargins = .init(edges: 16)
        configureHierarchy()
        configureConstraints()
    }
    
    // MARK: - Hierarchy
    
    func configureHierarchy() {
        addSubview(containerView)
        containerView.addArrangedSubviews([
            headerView,
            balanceView,
            cardView,
            quoteView,
            menuView
        ])
        configureConstraints()
    }
    
    func configureConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        let heightAnchor = containerView.heightAnchor.constraint(equalTo: heightAnchor)
        heightAnchor.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
}
