//
//  Coordinator.swift
//  CleanArchitecture
//
//  Created by Ibrahim Nasser Ibrahim on 01/03/2024.
//

import Foundation

protocol Coordinator {
    var router: Router { get }
    
    func start()
}
