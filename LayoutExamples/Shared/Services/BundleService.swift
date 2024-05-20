//
//  BundleService.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 09/05/24.
//

import Foundation

protocol BundleServiceProtocol {
    func loadJson<T: Decodable>(
        _ mockFile: String,
        model: T.Type,
        completion: @escaping Completion<AppResult<T>>
    )
}

class BundleService: BundleServiceProtocol {
    
    static var shared: BundleServiceProtocol = BundleService()
    
    // MARK: - Init
    
    // MARK: - BundleServiceProtocol Methods
    
    func loadJson<T: Decodable>(
        _ mockFile: String,
        model: T.Type,
        completion: @escaping Completion<AppResult<T>>
    ) {
        let mainQueue: DispatchQueue = DispatchQueue.main
        DispatchQueue.global(qos: .default).async {
            if let mock = Bundle.main.url(forResource: mockFile, withExtension: "json") {
                do {
                    let data = try Data(contentsOf: mock)
                    
                    do {
                        let response = try data.decode(type: ResponseData<T>.self)
                        mainQueue.async { completion(.success(response.results)) }
                    } catch let error {
                        mainQueue.async { completion(.failure(.mapping(message: error.localizedDescription))) }
                    }
                    
                } catch let error {
                    guard let apiError = error as? RequestError else {
                        mainQueue.async { completion(.failure(.unowned(message: error.localizedDescription))) }
                        return
                    }
                    
                    mainQueue.async {
                        completion(.failure(.requestError(
                            code: apiError.code,
                            title: apiError.title,
                            description: apiError.description
                        )))
                    }
                }
            }
        }
    }
}
