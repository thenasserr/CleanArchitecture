//
//  APIClient.swift
//  Combine+Learn
//
//  Created by Ibrahim Nasser Ibrahim on 29/02/2024.
//

import Combine
import Foundation

protocol BaseAPI {
    func fetch<T>(endpoint: Endpoint, type: T.Type) -> AnyPublisher<T, Error> where T: Decodable
}

extension BaseAPI {
    func fetch<T>(endpoint: Endpoint, type: T.Type) -> AnyPublisher<T, Error> where T: Decodable {
        var urlRequest = URLRequest(url: endpoint.baseURL.appendingPathComponent(endpoint.path))
        urlRequest.httpMethod = endpoint.method.rawValue
        endpoint.headers?.forEach {
            urlRequest.setValue($0.key, forHTTPHeaderField: $0.value)
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
