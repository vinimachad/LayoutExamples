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

extension HomeCoordinator: StackViewSampleCoordinatorDelegate, WalletControllerDelegate {
    func routeTo(_ destination: StackViewSampleModel.Item) {
        switch destination {
        case .wallet:
            let walletController = StackViewSampleFactory.wallet(coordinatorDelegate: self)
            navigationController.pushViewController(walletController, animated: true)
        }
    }
    
    func presentBottomSheet() {
        let controller = BottomSheetController()
        let navigation = UINavigationController(rootViewController: controller)
        navigation.modalPresentationStyle = .pageSheet
        
        controller.buildSheet(with: .init(
            title: "Teste sheet",
            textFields: [
                .init(name: "name", label: "User Name"),
                .init(name: "avatar_url", label: "Avatar url",  placeholder: "Avatar url"),
                .init(name: "balance", label: "Balance"),
                
            ]
        ))
        
        navigationController.present(navigation, animated: true)
    }
}
