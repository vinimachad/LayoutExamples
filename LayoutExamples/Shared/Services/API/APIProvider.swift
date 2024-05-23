//
//  ApiProvider.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 21/05/24.
//

import Foundation

protocol APIProviderProtocol {
    var body: [String: Any] { get }
    var path: String { get }
    var headers: [String: String] { get }
    var method: APIMethods { get }
}

extension APIProviderProtocol {
    var body: [String: Any] { [:] }
    var headers: [String: String] { [:] }
    var method: APIMethods { .get }
}
