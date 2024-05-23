//
//  UIView+Utils.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 03/05/24.
//

import UIKit

extension UIView {
    
    var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set {
            layer.masksToBounds = true
            layer.cornerRadius = newValue
        }
    }
    
    func setRounded() {
        cornerRadius = bounds.height / 2
    }
    
    func addShadow(radius: CGFloat = 0, opacity: Float = 0.2, color: UIColor = .black, pos: CGPoint = .zero) {
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = .zero
        layer.masksToBounds = false
        layer.shouldRasterize = true
        layer.shadowColor = color.cgColor
        layer.rasterizationScale = UIScreen.main.scale
        let rect = CGRect(x: bounds.origin.x + pos.x, y: bounds.origin.y + pos.y, width: bounds.width, height: bounds.height)
        layer.shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath
    }
    
    // MARK: - Subviews Methods
    
    func removeAllSubviews() {
        subviews.forEach { view in
            view.removeFromSuperview()
        }
    }
}
