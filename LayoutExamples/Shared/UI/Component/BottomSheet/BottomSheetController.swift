//
//  BottomSheetController.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 23/05/24.
//

import UIKit

class BottomSheetController: UIViewController {
    
    // MARK: - Private properties
    
    private var contentView: BottomSheetView
    
    // MARK: - Init
    
    init(contentView: BottomSheetView = BottomSheetView()) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.contentView = BottomSheetView()
        super.init(coder: coder)
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        view = contentView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setDefaultAppearance()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    // MARK: - Configure
    
    private func configure() {
        accessibilityViewIsModal = true
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .done, target: self, action: #selector(didDoneEdit))
        navigationItem.leftBarButtonItem = .init(barButtonSystemItem: .cancel, target: self, action: #selector(didCancelEdit))
        if let sheet = sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
        }
    }
    
    func buildSheet(with model: BottomSheetModel) {
        title = model.title
        contentView.viewModel = model
    }
    
    // MARK: - Actions Methods
    
    @objc private func didCancelEdit() {
        
    }
    
    @objc private func didDoneEdit() {
        
    }
}
