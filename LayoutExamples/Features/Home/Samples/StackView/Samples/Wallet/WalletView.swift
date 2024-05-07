//
//  WalletView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 05/05/24.
//

import UIKit

protocol WalletViewProtocol: UIView { }

class WalletView: VerticalStackView, WalletViewProtocol {
    
    private lazy var headerView: WalletHeaderView = {
        let view = WalletHeaderView()
        return view
    }()
    
    private lazy var balanceView: WalletBalanceView = {
        let view = WalletBalanceView()
        return view
    }()
    
    private lazy var cardView: HorizontalStackView = {
        let view = HorizontalStackView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var quoteView: HorizontalStackView = {
        let view = HorizontalStackView()
        view.backgroundColor = .blue
        return view
    }()
    
    private lazy var menuView: HorizontalStackView = {
        let view = HorizontalStackView()
        view.backgroundColor = .purple
        return view
    }()
    
    // MARK: - Configure
    
    override func configure() {
        super.configure()
        spacing = 32
        backgroundColor = #colorLiteral(red: 0.5843137255, green: 0.9411764706, blue: 0.7215686275, alpha: 1)
        layoutMargins = .init(edges: 32)
        configureHierarchy()
    }
    
    // MARK: - Hierarchy
    
    private func configureHierarchy() {
        addArrangedSubviews([
            headerView,
            balanceView,
            cardView,
            quoteView,
            menuView
        ])
    }
}
