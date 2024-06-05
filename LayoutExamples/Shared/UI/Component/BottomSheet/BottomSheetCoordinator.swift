//
//  BottomSheetCoordinator.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 31/05/24.
//

import UIKit

class BottomSheetCoordinator: CoordinatorProtocol {
    
    // MARK: - Public properties
    
    var childCoordinator: CoordinatorProtocol?
    var navigationController: UINavigationController = UINavigationController()
    
    // MARK: - Start
    
    @available(iOS, deprecated: 17, message: "Do not use this method this will return an empty UIViewController, instead use the start(_ model: BottomSheetModel) method")
    func start() -> UIViewController {
        return UIViewController()
    }
    
    func start(_ model: BottomSheetModel) -> UIViewController {
        let controler = BottomSheetController(model: model, coordinatorDelegate: self)
        navigationController.setViewControllers([controler], animated: true)
        navigationController.modalPresentationStyle = .pageSheet
        return navigationController
    }
}

// MARK: - BottomSheetControllerDelegate

extension BottomSheetCoordinator: BottomSheetControllerDelegate { }
