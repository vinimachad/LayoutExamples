//
//  HomeCoordinator.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 03/05/24.
//

import UIKit

protocol HomeCoordinatorDelegate: AnyObject, CoordinatorDelegate {
    func routeTo(_ destination: HomeCoordinator.Destinations)
}

final class HomeCoordinator: CoordinatorProtocol {
    
    typealias Destinations = HomeModel.Item.Name
    
    // MARK: - Public properties
    
    var navigationController: UINavigationController = UINavigationController()
    var childCoordinator: CoordinatorProtocol?
    
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
            let stackViewController = StackViewSampleFactory.create(coordinatorDelegate: self)
            navigationController.pushViewController(stackViewController, animated: true)
        case .collectionView: break
        case .tableView: break
        }
    }
}

// MARK: - StackViewSampleCoordinatorDelegate

extension HomeCoordinator: StackViewSampleCoordinatorDelegate {
    func routeTo(_ destination: StackViewSampleModel.Item) {
        switch destination {
        case .wallet:
            let walletController = StackViewSampleFactory.wallet()
            navigationController.pushViewController(walletController, animated: true)
        }
    }
}
