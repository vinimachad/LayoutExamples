//
//  VerticalStackView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 05/05/24.
//

import UIKit

class VerticalStackView: UIStackView, ConfigurableView {
    
    // MARK: - Public properties
    
    /// É responsável pelo alinhamento horizontal da view
    var horizontalAlignment: UIStackView.Alignment {
        get { alignment }
        set { alignment = newValue }
    }
    
    /// É responsável pela distribuição de altura da view
    var heightDistribution: UIStackView.Distribution {
        get { distribution }
        set { distribution = newValue }
    }
    
    override var layoutMargins: UIEdgeInsets {
        didSet {
            isLayoutMarginsRelativeArrangement = true
        }
    }
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        defaultConfigurations()
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        defaultConfigurations()
        configure()
    }
    
    // MARK: - Configure
    
    private func defaultConfigurations() {
        axis = .vertical
        horizontalAlignment = .fill
        heightDistribution = .fill
    }
    
    func configure() {
        configureHierarchy()
        configurePriorities()
        configureConstraints()
    }
    
    func configureHierarchy() {
        // Implement with override
    }
    
    func configurePriorities() {
        // Implement with override
    }
    
    func configureConstraints() {
        // Implement with override
    }
}
