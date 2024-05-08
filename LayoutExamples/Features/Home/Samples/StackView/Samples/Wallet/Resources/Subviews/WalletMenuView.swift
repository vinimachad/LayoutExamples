//
//  WalletMenuView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 07/05/24.
//

import UIKit

class WalletMenuView: HorizontalStackView {
    
    private typealias ButtonData = (bgColor: WalletColorLiterals, image: WalletImageLiterals?, text: String? )
    
    // MARK: - UI Components
    
    private lazy var addButton: UIButton = createButton(data: (bgColor: .white, image: .add, text: nil), action: nil)
    private lazy var scanButton: UIButton = createButton(data: (bgColor: .white, image: .scan, text: nil), action: nil)
    private lazy var paymentButton: UIButton = createButton(data: (bgColor: .blue, image: nil, text: "SWIFT Payment"), action: nil)
    
    // MARK: - Layout methods
    
    private func createButton(data: ButtonData, action: (() -> Void)? = nil) -> UIButton {
        let view = UIButton()
        view.cornerRadius = 16
        
        if let imageLiterals = data.image {
            view.setImage(.init(literal: imageLiterals)?.withRenderingMode(.alwaysTemplate), for: .normal)
            view.imageView?.tintColor = .black
            view.imageView?.contentMode = .scaleAspectFit
            configureButtonImageConstraints(view)
        } else if let text = data.text {
            view.setTitle(text, for: .normal)
        }
        
        view.backgroundColor = .init(literal: data.bgColor)
        action?()
        return view
    }
    
    // MARK: - Configure
    
    override func configure() {
        super.configure()
        spacing = 16
        configureHierarchy()
        configurePriorities()
    }
    
    private func configureHierarchy() {
        addArrangedSubviews([
            addButton,
            scanButton,
            paymentButton
        ])
    }
    
    private func configurePriorities() {
        paymentButton.setContentHuggingPriority(.init(100), for: .horizontal)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
    
    private func configureButtonImageConstraints(_ button: UIButton) {
        if let imageView = button.imageView {
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 60),
                button.widthAnchor.constraint(equalToConstant: 60),
            ])
        }
    }
}
