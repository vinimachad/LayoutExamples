//
//  TextField.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 24/05/24.
//

import UIKit

class TextField: UITextField {
    
    // MARK: - Public Properties
    
    var padding: UIEdgeInsets = .zero {
        didSet {
            setNeedsLayout()
        }
    }

    // MARK: - Rects
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return applyPaddingFor(bounds: bounds)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }

    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var viewRect = super.leftViewRect(forBounds: bounds)
        viewRect.origin.x += padding.left
        return viewRect
    }

    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var viewRect = super.rightViewRect(forBounds: bounds)
        viewRect.origin.x -= padding.right
        return viewRect
    }

    override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        var viewRect = super.clearButtonRect(forBounds: bounds)
        viewRect.origin.x -= padding.right
        return viewRect
    }

    private func applyPaddingFor(bounds: CGRect) -> CGRect {
        var padding = self.padding

        let leftBounds = leftViewRect(forBounds: bounds)
        if leftBounds.width != 0 {
            padding.left += leftBounds.width
        }

        let rightBounds = rightViewRect(forBounds: bounds)
        if rightBounds.width != 0 {
            padding.right += rightBounds.width
        }

        let clearBounds = clearButtonRect(forBounds: bounds)
        if clearBounds.width != 0 && isEditing {
            padding.right += clearBounds.width
        }

        return bounds.inset(by: padding)
    }
}
