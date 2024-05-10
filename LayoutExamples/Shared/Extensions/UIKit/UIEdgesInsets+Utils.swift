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
}
