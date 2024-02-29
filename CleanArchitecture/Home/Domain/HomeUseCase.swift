//
//  HomeUseCase.swift
//  CleanArchitecture
//
//  Created by Ibrahim Nasser Ibrahim on 29/02/2024.
//

import Foundation
import Combine

protocol HomeUseCaseProtocol {
    func getSectionLayouts() -> AnyPublisher<[any SectionsLayout], Error>
}

class HomeUseCase: HomeUseCaseProtocol {
    
    private let dishesAPIService: DishesAPI
    private var subscriptions = Set<AnyCancellable>()

    init(dishesAPIService: DishesAPI = DishesAPIService()) {
        self.dishesAPIService = dishesAPIService
    }
    
    var factory = HomeFactory()
    var homeModel: HomeModel? = HomeModel(sections: [])
    
    func getSectionLayouts() -> AnyPublisher<[any SectionsLayout], Error> {
        
    }
}
