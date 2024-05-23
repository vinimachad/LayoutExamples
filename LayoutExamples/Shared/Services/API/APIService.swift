//
//  APIServiceService.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 21/05/24.
//

import Foundation

protocol APIServiceProtocol {
    func fetch<Model: Decodable>(_ model: Model.Type, provider: APIProviderProtocol, completion: @escaping Completion<AppResult<Model>>)
}

class APIService: APIServiceProtocol {
    
    // MARK: - Public properties
    
    static var shared: APIServiceProtocol = APIService()
    
    // MARK: - Implementation Methods
    
    func fetch<Model: Decodable>(_ model: Model.Type, provider: APIProviderProtocol, completion: @escaping Completion<AppResult<Model>>) {
        guard let url = URL(string: provider.path) else {
            completion(.failure(.unowned(message: "URL inválida")))
            return
        }
        
        let mainQueue = DispatchQueue.main
        var request = URLRequest(url: url)
        request.httpMethod = provider.method.value
        setHeaders(&request, headers: provider.headers )
        
        DispatchQueue.global().async {
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error {
                    
                    guard let requestError = error as? RequestError else {
                        mainQueue.async {
                            completion(.failure(.requestError(code: 500, title: "Erro desconhecido", description: nil)))
                        }
                        return
                    }
                    
                    mainQueue.async {
                        completion(.failure(.requestError(code: requestError.code, title: requestError.title, description: requestError.description)))
                    }
                    return
                }
                
                guard let data else {
                    mainQueue.async { completion(.failure(.unowned(message: "Erro desconhecido"))) }
                    return
                }
                
                do {
                    let decodedData = try data.decode(type: Model.self)
                    mainQueue.async { completion(.success(decodedData)) }
                } catch let decodeError {
                    print("Mapping Error:", decodeError)
                    mainQueue.async { completion(.failure(.mapping(message: decodeError.localizedDescription))) }
                }
            }
            
            task.resume()
        }
        
    }
    
    func fetch(provider: APIProviderProtocol) {
        
    }
    
    // MARK: - Private Methods
    
    private func setHeaders(_ request: inout URLRequest, headers: [String: String]) {
        headers.forEach { key, value in
            request.addValue(key, forHTTPHeaderField: value)
        }
    }
}
