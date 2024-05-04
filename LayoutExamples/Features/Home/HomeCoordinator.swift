//
//  HomeCoordinator.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 03/05/24.
//

import UIKit

protocol HomeCoordinatorDelegate: AnyObject {
    func routeTo(_ destination: HomeCoordinator.Destinations)
}

class HomeCoordinator: CoordinatorProtocol {
    
    typealias Destinations = HomeModel.Item.Name
    
    // MARK: - Computed properties
    
    var navigationController: UINavigationController = UINavigationController()
    
    // MARK: - Start
    
    func start() -> UIViewController {
        let controller = HomeFactory.create(coordinatorDelegate: self)
        navigationController.setViewControllers([controller], animated: true)
        navigationController.modalPresentationStyle = .fullScreen
        return navigationController
    }
}

// MARK: - HomeCoordinatorDelegate

extension HomeCoordinator: HomeCoordinatorDelegate {
    func routeTo(_ destination: Destinations) {
        switch destination {
        case .stackView:
            let stackViewController = StackViewSampleController()
            navigationController.pushViewController(stackViewController, animated: true)
        case .collectionView: break
        case .tableView: break
        }
    }
}
