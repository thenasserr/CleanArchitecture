//
//  BooksEndPoint.swift
//  Combine+Learn
//
//  Created by Ibrahim Nasser Ibrahim on 29/02/2024.
//

import Foundation

enum AllDishesEndpoint {
    case fetchDishes
    case getDishes(String)
    
    struct Constants {
        static let baseUrl = "https://yummie.glitch.me"
        static let allDishesAPI = "/dish-categories"
    }
}

extension AllDishesEndpoint: Endpoint {
    var baseURL: URL {
        guard let url = URL(string: Constants.baseUrl) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
            case .fetchDishes:
                return Constants.allDishesAPI
            case .getDishes(let id):
                return "/dishes/\(id)"
        }
    }
    
    var method: HTTPRequestMethod {
        switch self {
            case .fetchDishes:
                return .get
            case .getDishes:
                return .get
        }
    }
    
    var headers: [String : String]? {
        switch self {
            case .fetchDishes:
                return nil
            case .getDishes:
                return nil
        }
    }
}
