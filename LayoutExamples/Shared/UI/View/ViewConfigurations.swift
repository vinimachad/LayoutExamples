//
//  ViewConfigurations.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 08/05/24.
//

import Foundation

protocol ConfigurableView {
    func configure()
    func configureHierarchy()
    func configurePriorities()
    func configureConstraints()
}

// MARK: - Default implementation

extension ConfigurableView {
    func configure() { }
    func configureHierarchy() { }
    func configurePriorities() { }
    func configureConstraints() { }
}
