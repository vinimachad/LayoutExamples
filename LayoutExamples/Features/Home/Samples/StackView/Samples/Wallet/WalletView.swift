//
//  WalletView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 05/05/24.
//

import UIKit

protocol WalletViewProtocol: UIView { }

class WalletView: VerticalStackView, WalletViewProtocol {
    
    private lazy var headerView: WalletHeaderView = WalletHeaderView()
    private lazy var balanceView: WalletBalanceView = WalletBalanceView()
    private lazy var cardView: HorizontalStackView = {
        let view = HorizontalStackView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var quoteView: WalletQuoteView = WalletQuoteView()
    private lazy var menuView: WalletMenuView = WalletMenuView()
    
    // MARK: - Configure
    
    override func configure() {
        super.configure()
        spacing = 16
        backgroundColor = #colorLiteral(red: 0.5843137255, green: 0.9411764706, blue: 0.7215686275, alpha: 1)
        layoutMargins = .init(edges: 16)
        configureHierarchy()
    }
    
    // MARK: - Hierarchy
    
    override func configureHierarchy() {
        addArrangedSubviews([
            headerView,
            balanceView,
            cardView,
            quoteView,
            menuView
        ])
    }
}
