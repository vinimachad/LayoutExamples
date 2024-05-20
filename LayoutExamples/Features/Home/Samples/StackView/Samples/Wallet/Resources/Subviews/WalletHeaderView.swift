//
//  WalletHeaderView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 06/05/24.
//

import UIKit

class WalletHeaderView: HorizontalStackView {
    
    typealias ViewModel = (name: String, avatarImage: String)
    
    // MARK: - Public properties
    
    var     viewModel: ViewModel? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - UI Components
    
    private lazy var iconView: UIImageView = {
        let view = UIImageView()
        view.setRounded()
        view.backgroundColor = .white
        view.contentMode = .scaleAspectFit
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
    
    // MARK: - Update Methods
    
    private func updateView() {
        guard let (name, avatarImage) = viewModel else { return}
        iconView.setImage(from: avatarImage, placeholder: UIImage(literal: WalletImageLiterals.scan))
        setupAttributedTextNameLabel(name: name)
    }
    
    // MARK: - Layout methods
    
    private func setupAttributedTextNameLabel(name: String) {
        let hello = "Hello,\n"
        
        let mutable = NSMutableAttributedString()
        mutable.addAttribute(.foregroundColor, value: UIColor.black.withAlphaComponent(0.7), string: hello)
        mutable.addAttributes([
            .font: UIFont.systemFont(ofSize: 16, weight: .bold),
            .foregroundColor: UIColor.black
        ], string: name)
        nameLabel.attributedText = mutable
    }
    
    // MARK: - Configure
    
    override func configure() {
        super.configure()
        widthDistribution = .equalSpacing
        verticalAlignment = .center
        setCustomSpacing(8, after: iconView, relation: .equal)
    }
    
    override func configureHierarchy() {
        addArrangedSubviews([
            iconView,
            nameLabel,
            moreButton
        ])
    }
    
    override func configureConstraints() {
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
