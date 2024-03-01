//
//  AppCoordinator.swift
//  CleanArchitecture
//
//  Created by Ibrahim Nasser Ibrahim on 01/03/2024.
//

import UIKit

protocol AppCoordinatorProtocol: Coordinator {
    func makeWindow(from windowScene: UIWindowScene)
}

class AppCoordinator: AppCoordinatorProtocol {
    
    static let shared = AppCoordinator()

    var window: UIWindow?
    
    var router: Router

    init() {
        router = AppRouter.init(navigationController: .init())
    }
    
    func makeWindow(from windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = self.router.navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
    
    
    func start() {
        showHome()
    }
    
    func showHome() {
        let factory = HomeFactory()
        let useCase = HomeUseCase(factory: factory)
        let viewModel = HomeViewModel(useCase: useCase, coordinator: self)
        let vc = HomeViewController(viewModel: viewModel)
        self.router.presentFullScreen(vc)
    }
    
    func showDetails(dish: Dish) {
        
    }
}
