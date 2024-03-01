//
//  HomeUseCase.swift
//  CleanArchitecture
//
//  Created by Ibrahim Nasser Ibrahim on 29/02/2024.
//

import Combine

protocol HomeUseCaseProtocol {
    func getSectionLayouts(delegate: HomeSectionsDelegate) async throws -> [any SectionsLayout]
}

class HomeUseCase: HomeUseCaseProtocol {

    private let dishesAPIService: DishesAPI
    private let factory: HomeFactory
    init(dishesAPIService: DishesAPI = DishesAPIService(), factory: HomeFactory) {
        self.dishesAPIService = dishesAPIService
        self.factory = factory
    }
        
    func getSectionLayouts(delegate: HomeSectionsDelegate) async throws -> [any SectionsLayout] {
        let dishes = try await dishesAPIService.fetchDishes()
        var sections: [any SectionsLayout] = []
        
        if let categories = dishes.data?.categories {
            let layout = factory.createSection(type: .categories(categories), delegate: delegate)
            sections.append(layout)
        }
        
        if let popular = dishes.data?.populars {
            let layout = factory.createSection(type: .populars(popular), delegate: delegate)
            sections.append(layout)
        }
        
        if let specials = dishes.data?.specials {
            let layout = factory.createSection(type: .specials(specials), delegate: delegate)
            sections.append(layout)
        }
        
        return sections
    }
}

