//
//  ViewModel.swift
//  Combine+Learn
//
//  Created by Ibrahim Nasser Ibrahim on 29/02/2024.
//

import Foundation
import Combine

class ViewModel {
    private let booksAPIService: DishesAPI
    private var subscriptions = Set<AnyCancellable>()

    init(booksAPIService: DishesAPI = DishesAPIService()) {
        self.booksAPIService = booksAPIService
    }
    
    func loadBooks() {
        booksAPIService.fetchBooks()
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case let .failure(error):
                    print("Couldn't get books: \(error)")
                case .finished: break
                }
            } receiveValue: { data in
                print(data.data?.categories)
            }.store(in: &subscriptions)
    }
}
