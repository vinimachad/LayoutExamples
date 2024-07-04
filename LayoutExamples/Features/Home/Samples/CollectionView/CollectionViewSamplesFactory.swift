//
//  CollectionViewSamplesFactory.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 03/07/24.
//

import UIKit

enum CollectionViewSamplesFactory {
    static func create(coordinatorDelegate: CollectionViewSamplesCoordinatorDelegate?) -> CollectionViewSamplesController {
        CollectionViewSamplesController(coordinatorDelegate: coordinatorDelegate)
    }
    
    static func appStore() -> UIViewController {
        UIViewController()
    }
}
