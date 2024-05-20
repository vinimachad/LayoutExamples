//
//  String+Utils.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 11/05/24.
//

import Foundation

extension String {
    
    // MARK: - Date Helpers
    
    enum DateFormats: String {
        case shortDate = "dd/MM/yyyy"
    }
    
    func toDate(_ format: DateFormats = .shortDate) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        guard let date = dateFormatter.date(from: self) else { return Date() }
        return date
    }
    
    func toISO8601() -> Date {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [
            .withDay, .withMonth, .withYear, .withTime,
            .withDashSeparatorInDate, .withColonSeparatorInTime
        ]
        guard let date = isoFormatter.date(from: self) else { return toDate() }
        return date
    }
}
