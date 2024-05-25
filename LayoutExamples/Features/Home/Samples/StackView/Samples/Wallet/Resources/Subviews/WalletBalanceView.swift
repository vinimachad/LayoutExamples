//
//  WalletBalanceView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 07/05/24.
//

import UIKit

class WalletBalanceView: VerticalStackView {
    
    // MARK: - Public properties
    
    var balance: String? {
        get { balanceLabel.text }
        set { balanceLabel.text = newValue }
    }
    
    // MARK: - UI Components
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Your Overall Balance"
        view.font = .systemFont(ofSize: 16, weight: .light)
        view.textColor = .black
        return view
    }()
    
    private lazy var balanceLabel: UILabel = {
        let view = UILabel()
        view.text = "$0,00"
        view.adjustsFontSizeToFitWidth = true
        view.font = .systemFont(ofSize: 60, weight: .semibold)
        view.textColor = .black
        return view
    }()
    
    // MARK: - Configure
    
    override func configure() {
        super.configure()
        spacing = 4
        horizontalAlignment = .leading
    }
    
     override func configureHierarchy() {
        addArrangedSubviews([titleLabel, balanceLabel])
    }
}
