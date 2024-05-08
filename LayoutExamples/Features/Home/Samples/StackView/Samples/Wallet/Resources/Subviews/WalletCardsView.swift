//
//  WalletCardsView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 08/05/24.
//

import UIKit

class WalletCardsView: VerticalStackView {
    
    // MARK: - UI Components
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cardView2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Configure
    
    override func configure() {
        super.configure()
        horizontalAlignment = .fill
    }
    
    override func configureHierarchy() {
        addArrangedSubviews([cardView, cardView2])
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            cardView.heightAnchor.constraint(equalToConstant: 150),
            cardView2.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}
