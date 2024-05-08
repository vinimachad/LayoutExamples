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
        view.backgroundColor = .white
        view.contentMode = .scaleAspectFit
        view.setImage(.init(literal: WalletImageLiterals.menu)?.withRenderingMode(.alwaysTemplate), for: .normal)
        view.imageView?.tintColor = .black
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
        mutable.addAttribute(.foregroundColor, value: UIColor.black.withAlphaComponent(0.5), string: full)
        mutable.addAttribute(.foregroundColor, value: UIColor.black, string: name)
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
    }
}
