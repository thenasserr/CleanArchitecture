//
//  HomeModel.swift
//  CleanArchitecture
//
//  Created by Ibrahim Nasser Ibrahim on 29/02/2024.
//

import Foundation

enum SectionsTypes {
    case categories([DishCategory])
    case populars([Dish])
}

class HomeFactory {
    func createSection(type: SectionsTypes, delegate: HomeSectionsDelegate) -> any SectionsLayout {
        switch type {
            case .categories(let categories):
                return CategoriesSection(items: categories, delegate: delegate)
            case .populars(let items):
                return PopularsSection(items: items, delegate: delegate)
        }
    }
    
}
