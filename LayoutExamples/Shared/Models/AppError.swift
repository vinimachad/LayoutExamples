//
//  AppError.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 09/05/24.
//

import Foundation

typealias AppResult<T> = Result<T, AppError>

enum AppError: Error {
    case unowned(message: String)
    case mapping(message: String)
    case requestError(code: Int = 400, title: String? = nil, description: String? = nil)
}

protocol RequestError {
    var code: Int { get }
    var title: String? { get }
    var description: String? { get }
}
