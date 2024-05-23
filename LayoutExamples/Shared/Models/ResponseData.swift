//
//  ResponseData.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 09/05/24.
//

import Foundation

typealias Completion<T> = (T) -> Void
typealias EmptyCompletion = () -> Void

struct ResponseData<T: Decodable>: Decodable {
    var results: T
}

struct AsyncResultHandler<Response: Decodable> {
    var success: Completion<Response>? = nil
    var failure: Completion<AppError>? = nil
    var finally: EmptyCompletion? = nil
}
