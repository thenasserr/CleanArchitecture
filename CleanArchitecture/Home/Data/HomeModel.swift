//
//  HomeModel.swift
//  CleanArchitecture
//
//  Created by Ibrahim Nasser Ibrahim on 29/02/2024.
//

import Foundation

struct HomeModel {
    let sections: [HomeType]
}

enum HomeType {
    case categories(items: [DishCategory])
    case populars(items: [Dish])
}
