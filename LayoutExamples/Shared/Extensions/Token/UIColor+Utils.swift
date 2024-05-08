//
//  UIColor+Utils.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 07/05/24.
//

import UIKit

extension UIColor {
    convenience init?(literal: ColorTokenProtocol) {
        self.init(named: literal.name)
    }
}
