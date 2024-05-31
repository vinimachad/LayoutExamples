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
            cardLogo: .menu,
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
                NSLayoutConstraint.activate([
                    cardView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                    cardView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                    cardView.centerYAnchor.constraint(equalTo: previousView.centerYAnchor, constant: 45)
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
        
        // MARK: - UI Components
        
        private lazy var dollarValueLabel: UILabel = {
            let view = createLabel()
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
            view.font = .preferredFont(forTextStyle: .body)
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
