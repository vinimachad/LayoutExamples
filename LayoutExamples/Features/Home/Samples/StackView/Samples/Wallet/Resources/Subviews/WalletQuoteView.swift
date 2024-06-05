//
//  WalletQuoteView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 07/05/24.
//

import UIKit

class WalletQuoteView: HorizontalStackView {
    
    // MARK: - Public properties
    
    var quotes: [WalletModel.Response.Quotes.Quote]? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Constant's
    
    private let kHorizontalItemSpacing: CGFloat = 32
    private let kCornerRadius: CGFloat = 16
    private let kMargin: CGFloat = 16
    
    // MARK: - Layout methods
    
    private func createQuoteDetails(data: (coin: String, quote: String)) -> VerticalStackView {
        let kVerticalItemSpacing: CGFloat = 4
        let coinLabel = createLabel(data.coin, fontSize: .body, weight: .regular)
        let quoteLabel = createLabel(data.quote, fontSize: .title2, weight: .bold)
        let view = VerticalStackView()
        view.horizontalAlignment = .leading
        view.spacing = kVerticalItemSpacing
        view.addArrangedSubviews([coinLabel, quoteLabel])
        return view
    }
    
    private func createLabel(_ text: String, fontSize: UIFont.Size, weight: UIFont.Weight) -> UILabel {
        let view = UILabel()
        view.font = .setFont(fontSize, weight: weight)
        view.textAlignment = .left
        view.textColor = .init(literal: WalletColorLiterals.white)
        view.text = text.uppercased()
        return view
    }
    
    // MARK: - Configure
    
    override func configure() {
        super.configure()
        spacing = kHorizontalItemSpacing
        verticalAlignment = .center
        widthDistribution = .equalSpacing
        cornerRadius = kCornerRadius
        layoutMargins = .init(edges: kMargin)
        backgroundColor = .init(literal: WalletColorLiterals.red)
    }
    
    // MARK: - Updates
    
    private func updateView() {
        guard let quotes else { return }
        removeAllSubviews()
        quotes.forEach { quote in
            addArrangedSubview(
                createQuoteDetails(data: (quote.coin, quote.value))
            )
        }
    }
}
