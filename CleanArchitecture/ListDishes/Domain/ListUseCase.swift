//
//  ListUseCase.swift
//  CleanArchitecture
//
//  Created by Ibrahim Nasser Ibrahim on 01/03/2024.
//

import Combine

protocol ListUseCaseProtocol {
    func getSectionLayouts(categoryId: String, delegate: ListSectionDelegate) async throws -> [any SectionsLayout]
}

class ListUseCase: ListUseCaseProtocol {
    private let listAPIService: ListDishesAPI
    private let factory: ListFactory
    private var category: DishCategory?
    
    init(listAPIService: ListDishesAPI = ListDishesAPIService(), factory: ListFactory) {
        self.listAPIService = listAPIService
        self.factory = factory
    }
    
    func getSectionLayouts(categoryId: String, delegate: ListSectionDelegate) async throws -> [any SectionsLayout] {
        let listDishes = try await listAPIService.fetchDishes(categoryId: categoryId)
        var sections: [any SectionsLayout] = []
        
        if let list = listDishes.data {
            print(list)
            let layout = factory.createSection(type: .list(list), delegate: delegate)
            sections.append(layout)
        }
        return sections
    }
}
