//
//  ButtonProtocol.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 04/06/24.
//

import UIKit

protocol ButtonProtocol: UIButton {
    func animateTap()
}

extension ButtonProtocol {
    func animateTap() {
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            options: .transitionCrossDissolve,
            animations: { [weak self] in self?.alpha = 0.8 },
            completion: { [weak self] _ in self?.alpha = 1 }
        )
        layoutIfNeeded()
    }
}

extension UIButton: ButtonProtocol { }
