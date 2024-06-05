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
    var cards: [WalletModel.Response.Card] = [] {
        didSet {
            updateView()
        }
    }
    
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
    
    private func createCard(data: WalletModel.Response.Card) -> Card {
        let contentView = Card()
        contentView.viewModel = (
            cardLogo: WalletImageLiterals(rawValue: data.logo.rawValue) ?? .mastercard,
            dollarValue: data.invoiceValue.toCurrency(),
            lastDigits: data.lastDigits,
            dueDate: data.dueDate.toString(format: .shortMonthYear),
            name: data.ownerName
        )
        return contentView
    }
    
    // MARK: - Configure
    
    func configure() {
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapContainerCards)))
    }
    
    // MARK: - Updates
    
    func updateView() {
        removeAllSubviews()
        cards.reversed().enumerated().forEach { index, cardData in
            let cardView = self.createCard(data: cardData)
            cardView.isUserInteractionEnabled = false
            addSubview(cardView)
            
            if index == 0 {
                NSLayoutConstraint.activate([
                    cardView.topAnchor.constraint(equalTo: self.topAnchor),
                    cardView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                    cardView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
                ])
                
                if (cards.count == 1) {
                    cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
                }
            } else {
                let previousView = subviews[subviews.previousIndex]
                let kVerticalSpacing: CGFloat = 45
                NSLayoutConstraint.activate([
                    cardView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                    cardView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                    cardView.centerYAnchor.constraint(equalTo: previousView.centerYAnchor, constant: kVerticalSpacing)
                ])
                
                if index == cards.lastIndex {
                    cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
                }
            }
        }
    }

    
    // MARK: - Actions
    
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
        
        // MARK: - Constant's
        
        private let kHorizontalItemSpacing: CGFloat = 40
        private let kCornerRadius: CGFloat = 16
        private let kMargin: CGFloat = 16
        
        // MARK: - UI Components
        
        private lazy var dollarValueLabel: UILabel = {
            let view = createLabel()
            view.font = .setFont(.title2, weight: .bold)
            return view
        }()
      
        // MARK: - Layout methods
        
        private func createHeader() -> HorizontalStackView {
            let kIconSize: CGFloat = 30
            let view = HorizontalStackView()
            view.widthDistribution = .equalSpacing
            view.verticalAlignment = .center
            let leftIconImageView = UIImageView()
            let righIconImageView = UIImageView()
            
            if let viewModel {
                leftIconImageView.image = .init(literal: viewModel.cardLogo)?.withTintColor(.gray, renderingMode: .alwaysOriginal)
                righIconImageView.image = .init(literal: WalletImageLiterals.more)?.withTintColor(.blue, renderingMode: .alwaysTemplate)
            }
            
            view.addArrangedSubviews([leftIconImageView, righIconImageView])
            NSLayoutConstraint.activate([
                righIconImageView.heightAnchor.constraint(equalToConstant: kIconSize),
                righIconImageView.widthAnchor.constraint(equalToConstant: kIconSize)
            ])
            return view
        }
        
        private func createInfos() -> HorizontalStackView {
            
            let view = HorizontalStackView()
            view.widthDistribution = .equalSpacing
            let cardNumberLabel = createLabel()
            let dueDateLabel = createLabel()
            let nameLabel = createLabel()
            
            if let viewModel {
                cardNumberLabel.text = viewModel.lastDigits
                dueDateLabel.text = viewModel.dueDate
                nameLabel.text = viewModel.name
            }
            
            view.addArrangedSubviews([cardNumberLabel, dueDateLabel, nameLabel])
            return view
        }
        
        private func createLabel() -> UILabel {
            let view = UILabel()
            view.textColor = .black
            view.font = .setFont(.body)
            return view
        }
        
        // MARK: - Life cycle
        
        override func layoutSubviews() {
            super.layoutSubviews()
            addShadow(radius: 10, opacity: 0.2, pos: .init(x: 0, y: -2))
        }
        
        // MARK: - Configure
        
        override func configure() {
            spacing = kHorizontalItemSpacing
            heightDistribution = .equalSpacing
            cornerRadius = kCornerRadius
            backgroundColor = .white
            layoutMargins = .init(edges: kMargin)
            translatesAutoresizingMaskIntoConstraints = false
            addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapCard)))
        }
        
        private func updateViewConfigurations() {
            dollarValueLabel.text = viewModel?.dollarValue
            addArrangedSubviews([createHeader(), dollarValueLabel, createInfos()])
        }
        
        // MARK: - Actions
        
        @objc private func didTapCard() {
            print("Did Tap On Card")
        }
    }
}
