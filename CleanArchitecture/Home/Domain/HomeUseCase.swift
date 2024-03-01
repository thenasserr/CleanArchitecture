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

    init(dishesAPIService: DishesAPI = DishesAPIService()) {
        self.dishesAPIService = dishesAPIService
    }
        
    func getSectionLayouts(delegate: HomeSectionsDelegate) async throws -> [any SectionsLayout] {
        let dishes = try await dishesAPIService.fetchDishes()
        var sections: [any SectionsLayout] = []
        
        if let categories = dishes.data?.categories {
            sections.append(createCategoriesSection(form: categories, delegate: delegate))
        }
        
        if let popular = dishes.data?.populars {
            sections.append(createPopularsSection(form: popular, delegate: delegate))
        }
        
        return sections
    }
    
    func createCategoriesSection(form categories: [DishCategory], delegate: CategoriesSectionDelegate) -> any SectionsLayout {
        return CategoriesSection(items: categories, delegate: delegate)
    }
    
    func createPopularsSection(form items: [Dish], delegate: PopularsSectionDelegate) -> any SectionsLayout {
        return PopularsSection(items: items, delegate: delegate)
    }
}

