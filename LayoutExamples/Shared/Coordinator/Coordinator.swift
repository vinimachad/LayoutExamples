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
    func dismiss()
    func returnToPrevious()
}

protocol CoordinatorDelegate {
    func dismiss()
    func returnToPrevious()
}

//  MARK: - Extensions

extension CoordinatorDelegate where Self: CoordinatorProtocol {
    func dismiss() {
        self.dismiss()
    }
    
    func returnToPrevious() {
        self.returnToPrevious()
    }
}

extension CoordinatorProtocol {
    func dismiss() {
        navigationController.dismiss(animated: true)
    }
    
    func returnToPrevious() {
        navigationController.popViewController(animated: true)
    }
}
