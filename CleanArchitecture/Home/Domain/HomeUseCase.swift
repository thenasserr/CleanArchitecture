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

enum SectionsTypes {
    case categories([DishCategory])
    case pupolars([Dish])
}

class HomeFactory {
    func createSection(type: SectionsTypes, delegate: HomeSectionsDelegate) -> any SectionsLayout {
        switch type {
            case .categories(let categories):
                return CategoriesSection(items: categories, delegate: delegate)
            case .pupolars(let items):
                return PopularsSection(items: items, delegate: delegate)
        }
    }
    
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
            let layout = factory.createSection(type: .pupolars(popular), delegate: delegate)
            sections.append(layout)
        }
        
        return sections
    }
}

