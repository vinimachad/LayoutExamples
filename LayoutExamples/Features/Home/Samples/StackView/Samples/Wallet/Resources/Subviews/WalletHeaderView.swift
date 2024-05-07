//
//  WalletHeaderView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 06/05/24.
//

import UIKit

class WalletHeaderView: HorizontalStackView {
    
    // MARK: - UI Components
    
    private lazy var iconView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.setRounded()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        return view
    }()
    
    private lazy var moreButton: UIButton = {
        let view = UIButton()
        view.setImage(.init(literal: WalletImageLiterals.menu), for: .normal)
        view.imageView?.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    // MARK: - Life cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconView.setRounded()
        moreButton.setRounded()
    }
    
    // MARK: - Layout methods
    
    private func setupAttributedTextNameLabel() {
        let name = "Vinicius"
        let full = "Hello,\n"
        
        let mutable = NSMutableAttributedString()
        mutable.addAttribute(.foregroundColor, value: UIColor.black, string: full)
        mutable.addAttribute(.foregroundColor, value: UIColor.red, string: name)
        nameLabel.attributedText = mutable
    }
    
    // MARK: - Configure
    
    override func configure() {
        super.configure()
        spacing = 8
        verticalAlignment = .center
        configureHierarchy()
        configurePriorities()
        configureConstraints()
        setupAttributedTextNameLabel()
    }
    
    private func configureHierarchy() {
        addArrangedSubviews([
            iconView,
            nameLabel,
            moreButton
        ])
    }
    
    private func configurePriorities() {
        nameLabel.setContentHuggingPriority(.init(100), for: .horizontal)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            iconView.widthAnchor.constraint(equalToConstant: 40),
            iconView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            moreButton.widthAnchor.constraint(equalToConstant: 40),
            moreButton.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        if let moreButtonImageView = moreButton.imageView {
            NSLayoutConstraint.activate([
                moreButtonImageView.heightAnchor.constraint(equalToConstant: 30),
                moreButtonImageView.widthAnchor.constraint(equalToConstant: 30)
            ])
        }
        
    }
}
