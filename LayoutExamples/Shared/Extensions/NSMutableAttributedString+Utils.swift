//
//  NSMutableAttributedString+Utils.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 07/05/24.
//

import UIKit

extension NSMutableAttributedString {
    func addAttribute(_ name: NSAttributedString.Key, value: Any, string: String) {
        let attrString = NSAttributedString(string: string, attributes: [name: value])
        self.append(attrString)
    }
    
    func addAttributes(_ attributes: [NSAttributedString.Key: Any], string: String) {
        let attrString = NSAttributedString(string: string, attributes: attributes)
        self.append(attrString)
    }
}
