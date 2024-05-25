//
//  UINavigationController+Style.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 08/05/24.
//

import UIKit

extension UINavigationController {
    
    private var appearance: UINavigationBarAppearance {
        get { self.navigationBar.standardAppearance }
        set { self.navigationBar.standardAppearance = newValue }
    }
    
    // MARK: - Appearance
    
    func resetNavigationAppearance() {
        navigationBar.tintColor = .systemBlue
        setDefaultAppearance()
    }
    
    func setDefaultAppearance(_ style: UINavigationBarAppearance? = nil, _ setScrollEdgeAppearance: Bool = true) {
        if let style {
            appearance = style
        } else {
            appearance = UINavigationBarAppearance()
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = .secondarySystemBackground
        }
        
        if (setScrollEdgeAppearance) {
            self.navigationBar.scrollEdgeAppearance = appearance
        }
    }
}
