//
//  AppCoordinator.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 04/05/24.
//

import UIKit

class AppCoordinator {
    
    // MARK: - Private properties
    
    private var window: UIWindow?
    private var childCoordinator: CoordinatorProtocol?
    
    // MARK: - Init
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    // MARK: - Start
    
    func start() {
        window?.rootViewController = homeController()
        window?.makeKeyAndVisible()
    }
    
    private func homeController() -> UIViewController {
        let coordinator = HomeCoordinator()
        childCoordinator = coordinator
        return coordinator.start()
    }
}
