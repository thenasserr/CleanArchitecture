//
//  BooksAPI.swift
//  Combine+Learn
//
//  Created by Ibrahim Nasser Ibrahim on 29/02/2024.
//

import Combine

protocol DishesAPI: BaseAPI {
    func fetchBooks() -> AnyPublisher<ResponseWrapper<AllDishes>, Error>
}

struct DishesAPIService: DishesAPI {
    func fetchBooks() -> AnyPublisher<ResponseWrapper<AllDishes>, Error> {
        return fetch(endpoint: AllDishesEndpoint.fetchBooks, type: ResponseWrapper<AllDishes>.self)
    }
}
