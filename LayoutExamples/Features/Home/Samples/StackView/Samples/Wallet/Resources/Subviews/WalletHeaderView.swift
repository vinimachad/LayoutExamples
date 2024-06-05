//
//  WalletHeaderView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 06/05/24.
//

import UIKit

protocol WalletHeaderViewDelegate: AnyObject {
    func didTapMore()
}

class WalletHeaderView: HorizontalStackView {
    
    typealias ViewModel = (name: String, avatarImage: String)
    
    // MARK: - Public properties
    
    weak var delegate: WalletHeaderViewDelegate?
    var viewModel: ViewModel? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Constant's
    
    private let kIconSize: CGFloat = 40
    
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
        view.addTarget(self, action: #selector(didTapMore), for: .touchUpInside)
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
            .font: UIFont.setFont(.headline, weight: .bold),
            .foregroundColor: UIColor.black
        ], string: name)
        nameLabel.attributedText = mutable
    }
    
    // MARK: - Actions
    
    @objc private func didTapMore() {
        delegate?.didTapMore()
    }
    
    // MARK: - Configure
    
    override func configure() {
        super.configure()
        let kCustomSpacing: CGFloat = 8
        widthDistribution = .equalSpacing
        verticalAlignment = .center
        setCustomSpacing(kCustomSpacing, after: iconView, relation: .equal)
    }
    
    override func configureHierarchy() {
        addArrangedSubviews([
            iconView,
            nameLabel,
            moreButton
        ])
        insertSpacerView(after: nameLabel)
    }
    
    override func configureConstraints() {
        NSLayoutConstraint.activate([
            iconView.widthAnchor.constraint(equalToConstant: kIconSize),
            iconView.heightAnchor.constraint(equalToConstant: kIconSize)
        ])
        
        NSLayoutConstraint.activate([
            moreButton.widthAnchor.constraint(equalToConstant: kIconSize),
            moreButton.heightAnchor.constraint(equalToConstant: kIconSize),
        ])
    }
}
