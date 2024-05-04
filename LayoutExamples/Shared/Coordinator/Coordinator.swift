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
    func start() -> UIViewController
    func dismiss()
    func returnToPrevious()
}

extension CoordinatorProtocol {
    func dismiss() {
        navigationController.dismiss(animated: true)
    }
    
    func returnToPrevious() {
        navigationController.popViewController(animated: true)
    }
}
