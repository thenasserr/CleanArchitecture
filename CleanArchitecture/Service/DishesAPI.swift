//
//  BooksAPI.swift
//  Combine+Learn
//
//  Created by Ibrahim Nasser Ibrahim on 29/02/2024.
//

import Combine

protocol DishesAPI: BaseAPI {
    func fetchDishes() async throws -> ResponseWrapper<AllDishes>
}

struct DishesAPIService: DishesAPI {
    func fetchDishes() async throws -> ResponseWrapper<AllDishes> {
        try await fetch(endpoint: AllDishesEndpoint.fetchBooks, type: ResponseWrapper<AllDishes>.self)
    }
}
