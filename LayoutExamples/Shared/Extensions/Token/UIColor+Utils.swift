//
//  UIColor+Utils.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 07/05/24.
//

import UIKit

extension UIColor {
    convenience init?(liteal: ColorTokenProtocol) {
        self.init(named: liteal.name)
    }
}
