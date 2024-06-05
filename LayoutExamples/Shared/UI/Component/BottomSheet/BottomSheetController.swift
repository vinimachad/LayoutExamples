//
//  BottomSheetController.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 23/05/24.
//

import UIKit

protocol BottomSheetControllerDelegate: AnyObject, CoordinatorDelegate {

}

class BottomSheetController: UIViewController {
    
    // MARK: - Private properties
    
    private var contentView: BottomSheetView
    private var model: BottomSheetModel?
    private weak var coordinatorDelegate: BottomSheetControllerDelegate?
    
    // MARK: - Init
    
    init(contentView: BottomSheetView = BottomSheetView(), model: BottomSheetModel, coordinatorDelegate: BottomSheetControllerDelegate?) {
        self.contentView = contentView
        self.model = model
        self.coordinatorDelegate = coordinatorDelegate
        self.contentView.viewModel = model
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
        title = self.model?.title
        accessibilityViewIsModal = true
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .done, target: self, action: #selector(didDoneEdit))
        navigationItem.leftBarButtonItem = .init(barButtonSystemItem: .cancel, target: self, action: #selector(didCancelEdit))
        if let sheet = sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
        }
    }
    
    // MARK: - Actions Methods
    
    @objc private func didCancelEdit() {
        coordinatorDelegate?.dismiss()
    }
    
    @objc private func didDoneEdit() {
        coordinatorDelegate?.dismiss()
        model?.onDoneEditing?()
    }
}
