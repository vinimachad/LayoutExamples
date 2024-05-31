//
//  Coordinator.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 03/05/24.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    var navigationController: UINavigationController { get }
    var childCoordinator: CoordinatorProtocol? { get set }
    func start() -> UIViewController
    func dismissController()
    func popController()
}

protocol CoordinatorDelegate {
    func dismiss()
    func returnToPrevious()
}

//  MARK: - Extensions

extension CoordinatorDelegate where Self: CoordinatorProtocol {
    func dismiss() {
        self.dismissController()
    }
    
    func returnToPrevious() {
        self.popController()
    }
}

extension CoordinatorProtocol {
    func dismissController() {
        navigationController.dismiss(animated: true)
    }
    
    func popController() {
        navigationController.popViewController(animated: true)
    }
}
