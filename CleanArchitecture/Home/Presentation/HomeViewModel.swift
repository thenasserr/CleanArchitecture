//
//  ViewModel.swift
//  Combine+Learn
//
//  Created by Ibrahim Nasser Ibrahim on 29/02/2024.
//

import Foundation

typealias HomeSectionsDelegate = PopularsSectionDelegate & CategoriesSectionDelegate & SpecialsSectionDelegate

class HomeViewModel {
    
    // MARK: - Properties
    private let useCase: HomeUseCase
    private var coordinator: AppCoordinator
    
    //MARK: - Initialization
    init(useCase: HomeUseCase, coordinator: AppCoordinator) {
        self.useCase = useCase
        self.coordinator = coordinator
    }
    
    func getSections() async throws -> [any SectionsLayout] {
        return try await useCase.getSectionLayouts(delegate: self)
    }
}

// MARK: - HomeViewModel Sections Delegate Methods
extension HomeViewModel: HomeSectionsDelegate  {
    func specialsSection(_ section: SpecialsSection, didSelect item: Dish) {
        print(item)
        coordinator.showDetails(dish: item)
    }
    
    func popularsSection(_ section: PopularsSection, didSelect item: Dish) {
        print(item)
        coordinator.showDetails(dish: item)
    }
    
    func categoriesSection(_ section: CategoriesSection, didSelect item: DishCategory) {
        print(item)
        coordinator.showList(id: item.id ?? "")
    }
}
