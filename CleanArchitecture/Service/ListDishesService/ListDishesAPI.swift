//
//  ListDishesAPI.swift
//  CleanArchitecture
//
//  Created by Ibrahim Nasser Ibrahim on 01/03/2024.
//

import Combine

protocol ListDishesAPI: BaseAPI {
    func fetchDishes(categoryId: String) async throws -> ResponseWrapper<[Dish]>
}

struct ListDishesAPIService: ListDishesAPI {
    func fetchDishes(categoryId: String) async throws -> ResponseWrapper<[Dish]> {
        try await fetch(endpoint: AllDishesEndpoint.getDishes(categoryId), type: ResponseWrapper<[Dish]>.self)
    }
}
