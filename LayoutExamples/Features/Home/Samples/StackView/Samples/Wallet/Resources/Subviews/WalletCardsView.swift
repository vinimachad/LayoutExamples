//
//  WalletCardsView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 08/05/24.
//

import UIKit

protocol WalletCardsDelegate: AnyObject {
    func didTapContainerCards()
}

final class WalletCardsView: UIView, ConfigurableView {
    
    // MARK: - Public properties
    
    weak var delegate: WalletCardsDelegate?
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    // MARK: - Layout methods
    
    private func createCard(data: UIColor) -> Card {
        let contentView = Card()
        contentView.viewModel = (
            cardLogo: .menu,
            dollarValue: "USD 16,450.00",
            lastDigits: "*********7839",
            dueDate: "07/25",
            name: "Arnold Jackson"
        )
        return contentView
    }
    
    // MARK: - Configure
    
    func configure() {
        let cards: [UIColor] = [.red, .gray, .blue, .red]
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapContainerCards)))
        cards.reversed().enumerated().forEach {
            let view = self.createCard(data: $0.element)
            view.isUserInteractionEnabled = false
            addSubview(view)
            
            if let viewIndexInSubviews = subviews.firstIndex(of: view) {
                let previousViewIndex = subviews.index(before: viewIndexInSubviews)
                
                if  viewIndexInSubviews == 0 {
                    let parentView = self
                    NSLayoutConstraint.activate([
                        view.topAnchor.constraint(equalTo: parentView.topAnchor),
                        view.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
                        view.trailingAnchor.constraint(equalTo: parentView.trailingAnchor)
                    ])
                } else {
                    
                    let previousView = subviews[previousViewIndex]
                    
                    if ((viewIndexInSubviews % (cards.count - 1)) != 0) {
                        NSLayoutConstraint.activate([
                            view.leadingAnchor.constraint(equalTo: leadingAnchor),
                            view.trailingAnchor.constraint(equalTo: trailingAnchor),
                            view.centerYAnchor.constraint(equalTo: previousView.centerYAnchor, constant: 45),
                        ])
                    } else {
                        NSLayoutConstraint.activate([
                            view.leadingAnchor.constraint(equalTo: leadingAnchor),
                            view.trailingAnchor.constraint(equalTo: trailingAnchor),
                            view.bottomAnchor.constraint(equalTo: bottomAnchor),
                            view.centerYAnchor.constraint(equalTo: previousView.centerYAnchor, constant: 45),
                        ])
                    }
                }
            }
        }
    }
    
    @objc private func didTapContainerCards() {
        delegate?.didTapContainerCards()
    }
}

extension WalletCardsView {
    private class Card: VerticalStackView {
        typealias ViewModel = (cardLogo: WalletImageLiterals, dollarValue: String, lastDigits: String, dueDate: String, name: String)
        
        // MARK: - Public properties
        
        var onTapCard: (() -> Void)?
        var viewModel: ViewModel? {
            didSet {
                updateViewConfigurations()
            }
        }
        
        // MARK: - UI Components
        
        private lazy var dollarValueLabel: UILabel = {
            let view = UILabel()
            view.font = .systemFont(ofSize: 25, weight: .medium)
            return view
        }()
      
        // MARK: - Layout methods
        
        private func createHeader() -> HorizontalStackView {
            let view = HorizontalStackView()
            view.widthDistribution = .equalSpacing
            let leftIconImageView = UIImageView()
            let righIconImageView = UIImageView()
            
            if let viewModel {
                leftIconImageView.contentMode = .scaleAspectFit
                righIconImageView.contentMode = .scaleAspectFit
                leftIconImageView.image = .init(literal: viewModel.cardLogo)?.withTintColor(.gray, renderingMode: .alwaysTemplate)
                righIconImageView.image = .init(literal: WalletImageLiterals.more)?.withTintColor(.blue, renderingMode: .alwaysTemplate)
            }
            
            view.addArrangedSubviews([leftIconImageView, righIconImageView])
            return view
        }
        
        private func createInfos() -> HorizontalStackView {
            
            let view = HorizontalStackView()
            view.widthDistribution = .equalSpacing
            let cardNumberLabel = UILabel()
            let dueDateLabel = UILabel()
            let nameLabel = UILabel()
            
            if let viewModel {
                cardNumberLabel.text = viewModel.lastDigits
                dueDateLabel.text = viewModel.dueDate
                nameLabel.text = viewModel.name
            }
            
            view.addArrangedSubviews([cardNumberLabel, dueDateLabel, nameLabel])
            return view
        }
        
        // MARK: - Life cycle
        
        override func layoutSubviews() {
            super.layoutSubviews()
            addShadow(radius: 10, opacity: 0.2, pos: .init(x: 0, y: -2))
        }
        
        // MARK: - Configure
        
        override func configure() {
            spacing = 40
            heightDistribution = .equalSpacing
            cornerRadius = 16
            backgroundColor = .white
            layoutMargins = .init(edges: 16)
            translatesAutoresizingMaskIntoConstraints = false
            addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapCard)))
        }
        
        private func updateViewConfigurations() {
            dollarValueLabel.text = viewModel?.dollarValue
            addArrangedSubviews([createHeader(), dollarValueLabel, createInfos()])
        }
        
        // MARK: - Actions
        
        @objc private func didTapCard() {
            print("testecard")
        }
    }
}
