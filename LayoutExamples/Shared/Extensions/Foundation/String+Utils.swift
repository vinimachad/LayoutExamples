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
        case fullDate = "dd/MM/yyyy"
        case shortMonthYear = "MM/yy"
    }
    
    func toDate(_ format: DateFormats = .fullDate) -> Date {
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
