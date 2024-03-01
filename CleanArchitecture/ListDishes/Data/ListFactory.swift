//
//  ListFactory.swift
//  CleanArchitecture
//
//  Created by Ibrahim Nasser Ibrahim on 01/03/2024.
//

import Foundation

enum ListTypes {
    case list([Dish])
}

class ListFactory {
    func createSection(type: ListTypes, delegate: ListSectionDelegate) -> any SectionsLayout {
        switch type {
            case .list(let list):
                return ListSection(items: list, delegate: delegate)
        }
    }
}
