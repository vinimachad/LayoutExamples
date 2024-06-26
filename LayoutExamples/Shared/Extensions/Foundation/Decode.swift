//
//  Decoder+Utils.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 09/05/24.
//

import Foundation

extension Data {
    
    /// Responsável por realizar o decode apartir do Data com a estratégia de converter do snake case
    /// - Parameters:
    ///    - type: O modelo que você irá realizar a decodificaçao do Data.
    func decode<T: Decodable>(type: T.Type) throws -> T {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = dateDecodingStrategy
        return try decoder.decode(type, from: self)
    }
    
    private var dateDecodingStrategy: JSONDecoder.DateDecodingStrategy {
        .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateStr = try container.decode(String.self)
            return dateStr.toISO8601()
        }
    }
}
