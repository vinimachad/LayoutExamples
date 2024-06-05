//
//  Blur.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 23/05/24.
//

import UIKit

protocol NeedBlur {
    func showBlur()
    func hideBlur()
}

extension NeedBlur where Self: UIViewController {
    
    static var blurViewTag: Int { 2 }
    
    func showBlur() {
        let blurView = UIVisualEffectView()
        blurView.tag = Self.blurViewTag
        blurView.effect = UIBlurEffect(style: .regular)
        view.addSubview(blurView)
        view.bringSubviewToFront(blurView)
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.topAnchor),
        ])
    }
    
    func hideBlur() {
        let blurView = view.viewWithTag(Self.blurViewTag)
        blurView?.removeFromSuperview()
    }
}
