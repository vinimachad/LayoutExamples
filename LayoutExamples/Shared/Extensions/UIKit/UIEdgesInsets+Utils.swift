//
//  UIEdges+Utils.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 05/05/24.
//

import UIKit

extension UIEdgeInsets {
    
    /// Adiciona margem em todas as direções da view
    init(edges insets: CGFloat) {
        self.init(top: insets, left: insets, bottom: insets, right: insets)
    }
    
    /// Adiciona margem separadamente para as direções da view
    init(horizontal xInsets: CGFloat, vertical yInsets: CGFloat) {
        self.init(top: yInsets, left: xInsets, bottom: yInsets, right: xInsets)
    }
    
    init(top: CGFloat) {
        self.init(top: top, left: 0, bottom: 0, right: 0)
    }
    
    init(left: CGFloat) {
        self.init(top: 0, left: left, bottom: 0, right: 0)
    }
    
    init(right: CGFloat) {
        self.init(top: 0, left: 0, bottom: 0, right: right)
    }
    
    init(bottom: CGFloat) {
        self.init(top: 0, left: 0, bottom: bottom, right: 0)
    }
}
