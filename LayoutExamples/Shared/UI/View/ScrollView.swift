//
//  ScrollView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 08/05/24.
//

import UIKit

class ScrollView<View: UIView>: UIScrollView, ConfigurableView {
    
    // MARK: - UI Components
    
    var contentView: View? {
        didSet {
            configure()
        }
    }
    
    // MARK: - Configure
    
    func configure() {
        configureHierarchy()
        configurePriorities()
        configureConstraints()
    }
    
    func configureHierarchy() {
        guard let contentView else { return }
        addSubview(contentView)
    }
    
    func configureConstraints() {
        guard let contentView else { return }
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: self.widthAnchor),
        ])
    }
}
