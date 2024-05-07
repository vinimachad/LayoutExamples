//
//  UIImage+Utils.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 07/05/24.
//

import UIKit

extension UIImage {
    
    convenience init?(literal: ImageTokenProtocol) {
        self.init(named: literal.name)
    }
}
