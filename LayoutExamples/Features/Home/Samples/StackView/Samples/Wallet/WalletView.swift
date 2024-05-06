//
//  WalletView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 05/05/24.
//

import UIKit

protocol WalletViewProtocol: UIView { }

class WalletView: VerticalStackView, WalletViewProtocol {
    
    private lazy var headerView: HorizontalStackView = {
        let view = HorizontalStackView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var balanceView: VerticalStackView = {
        let view = VerticalStackView()
        view.backgroundColor = .red
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
        heightDistribution = .fillProportionally
        spacing = 32
        layoutMargins = .init(edges: 32)
        backgroundColor = #colorLiteral(red: 0.582781136, green: 0.9413846135, blue: 0.7231652141, alpha: 1)
        configureHierarchy()
    }
    
    // MARK: - Hierarchy
    
    private func configureHierarchy() {
        addArrangedSubviews([headerView, balanceView, cardView, quoteView, menuView])
    }
}
