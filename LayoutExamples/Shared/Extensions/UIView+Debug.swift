//
//  UIView+Debug.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 02/05/24.
//

import UIKit

extension UIView {
    static var debugViewTag: Int {
        10
    }
    
    func debug() {
        if let existingDebugView = viewWithTag(UIView.debugViewTag) {
            existingDebugView.removeFromSuperview()
        }
        
        let frame = self.bounds
        let debugView = UIView(frame: frame)
        debugView.layer.borderColor = UIColor.red.cgColor
        debugView.layer.borderWidth = 1
        debugView.layer.masksToBounds = true
        debugView.isUserInteractionEnabled = false
        debugView.tag = UIView.debugViewTag
        addSubview(debugView)
        bringSubviewToFront(debugView)
    }
}
