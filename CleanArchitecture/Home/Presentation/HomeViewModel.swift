//
//  ViewModel.swift
//  Combine+Learn
//
//  Created by Ibrahim Nasser Ibrahim on 29/02/2024.
//

import Foundation
import Combine

class HomeViewModel {
    private let dishesAPIService: DishesAPI
    private var subscriptions = Set<AnyCancellable>()

    init(dishesAPIService: DishesAPI = DishesAPIService()) {
        self.dishesAPIService = dishesAPIService
    }
    
    func getAllDishes() {
        dishesAPIService.fetchDishes()
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case let .failure(error):
                    print("Couldn't get books: \(error)")
                case .finished: break
                }
            } receiveValue: { data in
                print(data.data)
            }.store(in: &subscriptions)
    }
}
