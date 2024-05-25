//
//  BottomSheetButton.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 23/05/24.
//

import UIKit

class BottomSheetButton: UIButton, ConfigurableView {
    
    // MARK: - Public Properties
    
    var viewModel: BottomSheetButtonModel? {
        didSet { updateView() }
    }
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    // MARK: - Configure
    
    // MARK: - Update
    
    private func updateView() {
        setTitle(viewModel?.label, for: .normal)
        role = viewModel?.role ?? .normal
        configuration = viewModel?.configuration
    }
}
