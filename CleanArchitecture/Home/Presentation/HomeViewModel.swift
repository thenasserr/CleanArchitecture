//
//  ViewModel.swift
//  Combine+Learn
//
//  Created by Ibrahim Nasser Ibrahim on 29/02/2024.
//

import Foundation
import Combine

typealias HomeSectionsDelegate = PopularsSectionDelegate & CategoriesSectionDelegate


class HomeViewModel {
    
    private var subscriptions = Set<AnyCancellable>()
    private let useCase: HomeUseCase
    private var coordinator: AppCoordinator
    
    init(useCase: HomeUseCase, coordinator: AppCoordinator) {
        self.useCase = useCase
        self.coordinator = coordinator
    }
    
    func getSections() async throws -> [any SectionsLayout] {
        return try await useCase.getSectionLayouts(delegate: self)
    }
}


extension HomeViewModel: HomeSectionsDelegate  {
    func popularsSection(_ section: PopularsSection, didSelect item: Dish) {
        print(item)
        coordinator.showDetails(dish: item)
    }
    
    func categoriesSection(_ section: CategoriesSection, didSelect item: DishCategory) {
        print(item)
    }
}
