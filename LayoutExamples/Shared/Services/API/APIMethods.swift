//
//  APIMethods.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 21/05/24.
//

import Foundation

enum APIMethods: String {
    case get
    case post
    case put
    
    var value: String {
        return rawValue.uppercased()
    }
}
