//
//  BottomSheetView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 23/05/24.
//

import UIKit

class BottomSheetView: ScrollView<VerticalStackView> {
    
    var viewModel: BottomSheetModel? {
        didSet { updateView() }
    }
    
    // MARK: - Layout Methods
    
    func createFieldsContainerView() -> VerticalStackView {
        let containerView = VerticalStackView()
        let textFields = viewModel?.textFields.map { model -> BottomSheetTextField in
            let view = BottomSheetTextField()
            view.viewModel = model
            return view
        } ?? []
        
        containerView.spacing = 16
        containerView.addArrangedSubviews(textFields)
        return containerView
    }
    
    func createButtonsContainerView() -> VerticalStackView {
        let containerView = VerticalStackView()
        let buttons = viewModel?.buttons.map { model -> BottomSheetButton in
            let view = BottomSheetButton()
            view.viewModel = model
            return view
        } ?? []
        
        containerView.spacing = 16
        containerView.addArrangedSubviews(buttons)
        return containerView
    }
    
    // MARK: - Configure
    
    override func configure() {
        super.configure()
        backgroundColor = .systemBackground
        contentView?.spacing = 32
        contentView?.layoutMargins = .init(edges: 16)
        contentView?.heightDistribution = .equalSpacing
    }
    
    // MARK: - Update
    
    private func updateView() {
        contentView?.addArrangedSubviews([createFieldsContainerView(), createButtonsContainerView()])
    }
}
