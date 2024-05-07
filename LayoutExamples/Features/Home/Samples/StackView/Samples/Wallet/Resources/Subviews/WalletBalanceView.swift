//
//  WalletBalanceView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 07/05/24.
//

import UIKit

class WalletBalanceView: VerticalStackView {
    
    // MARK: - UI Components
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Your Overall Balance"
        view.font = .systemFont(ofSize: 16, weight: .light)
        return view
    }()
    
    private lazy var balanceLabel: UILabel = {
        let view = UILabel()
        view.text = "$32,184.00"
        view.adjustsFontSizeToFitWidth = true
        view.font = .systemFont(ofSize: 60, weight: .semibold)
        return view
    }()
    
    // MARK: - Configure
    
    override func configure() {
        super.configure()
        spacing = 4
        horizontalAlignment = .leading
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        addArrangedSubviews([titleLabel, balanceLabel])
    }
}
