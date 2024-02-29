//
//  HomeFactory.swift
//  CleanArchitecture
//
//  Created by Ibrahim Nasser Ibrahim on 29/02/2024.
//

import Foundation

typealias HomeSectionsDelegate = PopularsSectionDelegate & CategoriesSectionDelegate

class HomeFactory {
    
    let delegate: HomeSectionsDelegate
    init(delegate: HomeSectionsDelegate) {
        self.delegate = delegate
    }
    
    func createSections(section: HomeType) -> any SectionsLayout {
        switch section {
                
            case .categories(items: let items):
                return CategoriesSection(items: items, delegate: delegate)
            case .populars(items: let items):
                return PopularsSection(items: items, delegate: delegate)
        }
    }
}
