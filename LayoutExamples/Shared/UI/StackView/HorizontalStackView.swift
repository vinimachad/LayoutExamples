//
//  HorizontalStackView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 05/05/24.
//

import UIKit

class HorizontalStackView: UIStackView {
    
    // MARK: - Public properties
    
    /// É responsável pelo alinhamento horizontal da view
    var horizontalAlignment: UIStackView.Alignment {
        get { alignment }
        set { alignment = newValue }
    }
    
    /// É responsável pela distribuição de largura da view
    var widthDistribution: UIStackView.Distribution {
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
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    // MARK: - Configure
    
    func configure() {
        axis = .horizontal
        widthDistribution = .fill
        horizontalAlignment = .fill
    }
}
