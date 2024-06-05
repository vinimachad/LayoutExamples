//
//  Fonts.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 04/06/24.
//

import UIKit

extension UIFont {
    
    enum Size: CGFloat {
        case largeTitle = 34
        case title1 = 28
        case title2 = 22
        case title3 = 20
        case headline = 17
        case body = 16
        case callout = 15
        case subhead = 14
        case footnote = 13
        case caption1 = 12
        case caption2 = 11
    }
    
    static func setFont(_ size: Size, weight: Weight = .regular) -> UIFont {
        systemFont(ofSize: size.rawValue, weight: weight)
    }
}
