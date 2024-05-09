//
//  WalletCardsView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 08/05/24.
//

import UIKit

class WalletCardsView: UIView, ConfigurableView {
    
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
    
    private func createCard(data: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = data
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    // MARK: - Configure
    
    func configure() {
        let cards: [UIColor] = [.red, .gray, .blue, .black, .systemPink, .green, .cyan, .purple]
        
        cards.reversed().enumerated().forEach {
            let view = self.createCard(data: $0.element)
            addSubview(view)
            
            if let viewIndexInSubviews = subviews.firstIndex(of: view) {
                let previousViewIndex = subviews.index(before: viewIndexInSubviews)
                
                if  viewIndexInSubviews == 0 {
                    let parentView = self
                    
                    NSLayoutConstraint.activate([
                        view.heightAnchor.constraint(equalToConstant: 150),
                        view.topAnchor.constraint(equalTo: parentView.topAnchor),
                        view.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
                        view.trailingAnchor.constraint(equalTo: parentView.trailingAnchor)
                    ])
                } else {
                    
                    let previousView = subviews[previousViewIndex]
                    
                    if ((viewIndexInSubviews % (cards.count - 1)) != 0) {
                        NSLayoutConstraint.activate([
                            view.heightAnchor.constraint(equalToConstant: 150),
                            view.leadingAnchor.constraint(equalTo: leadingAnchor),
                            view.trailingAnchor.constraint(equalTo: trailingAnchor),
                            view.centerYAnchor.constraint(equalTo: previousView.centerYAnchor, constant: 45),
                        ])
                    } else {
                        NSLayoutConstraint.activate([
                            view.heightAnchor.constraint(equalToConstant: 150),
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
}
