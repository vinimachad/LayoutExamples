//
//  UIStackView+Utils.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 05/05/24.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { self.addArrangedSubview($0) }
    }
    
    func setCustomSpacing(_ spacing: CGFloat, after arrangedSubview: UIView, relation: NSLayoutConstraint.Relation = .greaterThanOrEqual) {
        guard let viewIndex = arrangedSubviews.firstIndex(of: arrangedSubview) else { return }
        let nextViewIndex = arrangedSubviews.index(after: viewIndex)
        guard nextViewIndex < subviews.count else { return }
        
        let constant = spacing * -1
        
        var constraint: NSLayoutConstraint?
        switch relation {
        case .greaterThanOrEqual: 
             constraint = arrangedSubview.trailingAnchor.constraint(greaterThanOrEqualTo: subviews[nextViewIndex].leadingAnchor, constant: constant)
        case .lessThanOrEqual:
            constraint = arrangedSubview.trailingAnchor.constraint(lessThanOrEqualTo: subviews[nextViewIndex].leadingAnchor, constant: constant)
        case .equal:
            constraint = arrangedSubview.trailingAnchor.constraint(equalTo: subviews[nextViewIndex].leadingAnchor, constant: constant)
        @unknown default: break
        }
        
        constraint?.isActive = true
    }
}
