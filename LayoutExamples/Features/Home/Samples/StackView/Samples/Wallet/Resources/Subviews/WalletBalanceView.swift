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
    
    // MARK: - Constant's
    
    private let kVerticalItemSpacing: CGFloat = 4
    
    // MARK: - UI Components
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Your Overall Balance"
        view.font = .setFont(.body, weight: .light)
        view.textColor = .black
        return view
    }()
    
    private lazy var balanceLabel: UILabel = {
        let view = UILabel()
        view.text = "$0,00"
        view.adjustsFontSizeToFitWidth = true
        view.font = .setFont(.largeTitle, weight: .bold)
        view.textColor = .black
        return view
    }()
    
    // MARK: - Configure
    
    override func configure() {
        super.configure()
        spacing = kVerticalItemSpacing
        horizontalAlignment = .leading
    }
    
     override func configureHierarchy() {
        addArrangedSubviews([titleLabel, balanceLabel])
    }
}
