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
    
    // MARK: - Layout methods
    
    private func createQuoteDetails(data: (coin: String, quote: String)) -> VerticalStackView {
        let coinLabel = createLabel(data.coin, fontSize: 16, weight: .light)
        let quoteLabel = createLabel(data.quote, fontSize: 25, weight: .bold)
        let view = VerticalStackView()
        view.horizontalAlignment = .leading
        view.spacing = 4
        view.addArrangedSubviews([coinLabel, quoteLabel])
        return view
    }
    
    private func createLabel(_ text: String, fontSize: CGFloat, weight: UIFont.Weight) -> UILabel {
        let view = UILabel()
        view.font = .systemFont(ofSize: fontSize, weight: weight)
        view.textAlignment = .left
        view.textColor = .init(literal: WalletColorLiterals.white)
        view.adjustsFontSizeToFitWidth = true
        view.text = text.uppercased()
        return view
    }
    
    // MARK: - Configure
    
    override func configure() {
        super.configure()
        spacing = 32
        verticalAlignment = .center
        widthDistribution = .equalSpacing
        cornerRadius = 16
        layoutMargins = .init(edges: 16)
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
