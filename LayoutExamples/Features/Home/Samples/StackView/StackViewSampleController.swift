//
//  StackViewSampleController.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 03/05/24.
//

import UIKit

class StackViewSampleController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func loadView() {
        super.loadView()
        let view = UIView()
        view.backgroundColor = .red
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: view.topAnchor),
            view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        self.view = view
    }
    
}
