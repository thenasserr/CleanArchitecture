//
//  ListDishesViewModel.swift
//  CleanArchitecture
//
//  Created by Ibrahim Nasser Ibrahim on 01/03/2024.
//

import Foundation

class ListDishesViewModel {
    
    var useCase: ListUseCase
    var dish: DishCategory?
    
    init(useCase: ListUseCase) {
        self.useCase = useCase
    }
    
    func getSections() async throws -> [any SectionsLayout] {
        return try await useCase.getSectionLayouts(categoryId: dish?.id ?? "", delegate: self)
    }
}

extension ListDishesViewModel: ListSectionDelegate {
    func listSection(_ section: ListSection, didSelect item: Dish) {
        print(item)
    }
}
