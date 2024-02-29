//
//  BooksEndPoint.swift
//  Combine+Learn
//
//  Created by Ibrahim Nasser Ibrahim on 29/02/2024.
//

import Foundation

enum AllDishesEndpoint {
    case fetchBooks
    
    struct Constants {
        static let baseUrl = "https://yummie.glitch.me"
        static let booksAPI = "/dish-categories"
    }
}

extension AllDishesEndpoint: Endpoint {
    var baseURL: URL {
        guard let url = URL(string: Constants.baseUrl) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .fetchBooks:
            return Constants.booksAPI
        }
    }
    
    var method: HTTPRequestMethod {
        switch self {
        case .fetchBooks:
            return .get
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .fetchBooks:
            return nil
        }
    }
}
