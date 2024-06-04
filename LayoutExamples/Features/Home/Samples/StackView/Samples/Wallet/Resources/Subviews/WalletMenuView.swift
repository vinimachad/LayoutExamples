//
//  WalletMenuView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 07/05/24.
//

import UIKit

protocol WalletMenuViewDelegate: AnyObject {
    func didTapAdd()
    func didTapScan()
    func didTapPay()
}

class WalletMenuView: HorizontalStackView {
    
    private typealias ButtonData = (bgColor: WalletColorLiterals, image: WalletImageLiterals?, text: String? )
    
    // MARK: - Public properties
    
    weak var delegate: WalletMenuViewDelegate?
    
    // MARK: - Constant's
    
    private let kCornerRadius: CGFloat = 16
    private let kHorizontalItemSpacing: CGFloat = 16
    private let kButtonSize: CGFloat = 60
    
    // MARK: - UI Components
    
    private lazy var addButton: UIButton = createButton(data: (bgColor: .white, image: .add, text: nil), action: #selector(didTapAdd))
    private lazy var scanButton: UIButton = createButton(data: (bgColor: .white, image: .scan, text: nil), action: #selector(didTapScan))
    private lazy var paymentButton: UIButton = createButton(data: (bgColor: .blue, image: nil, text: "SWIFT Payment"), action: #selector(didTapPay))
    
    // MARK: - Layout methods
    
    private func createButton(data: ButtonData, action: Selector) -> UIButton {
        let view: ButtonProtocol = UIButton()
        view.cornerRadius = kCornerRadius
        
        if let imageLiterals = data.image {
            view.setImage(.init(literal: imageLiterals)?.withRenderingMode(.alwaysTemplate), for: .normal)
            view.imageView?.tintColor = .black
            view.imageView?.contentMode = .scaleAspectFit
            configureButtonImageConstraints(view)
        } else if let text = data.text {
            view.setTitle(text, for: .normal)
        }
        
        view.backgroundColor = .init(literal: data.bgColor)
        view.addTarget(self, action: action, for: .touchUpInside)
        return view
    }
    
    // MARK: - Configure
    
    override func configure() {
        super.configure()
        spacing = kHorizontalItemSpacing
    }
    
    override func configureHierarchy() {
        addArrangedSubviews([
            addButton,
            scanButton,
            paymentButton
        ])
    }
    
    override func configurePriorities() {
        paymentButton.setContentExpansionPriority(.high, for: .horizontal)
    }
    
    private func configureButtonImageConstraints(_ button: UIButton) {
        if let imageView = button.imageView {
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: kButtonSize),
                button.widthAnchor.constraint(equalToConstant: kButtonSize),
            ])
        }
    }
    
    // MARK: - Actions
    
    @objc private func didTapAdd(sender: UIButton) {
        sender.animateTap()
        delegate?.didTapAdd()
    }
    
    @objc private func didTapScan(sender: UIButton) {
        sender.animateTap()
        delegate?.didTapScan()
    }
    
    @objc private func didTapPay(sender: UIButton) {
        sender.animateTap()
        delegate?.didTapPay()
    }
}
