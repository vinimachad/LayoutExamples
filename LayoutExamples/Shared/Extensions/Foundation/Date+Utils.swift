//
//  Date+Utils.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 20/05/24.
//

import Foundation

extension Date {
    
    func toString(format: String.DateFormats = .fullDate) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.string(from: self)
    }
}
