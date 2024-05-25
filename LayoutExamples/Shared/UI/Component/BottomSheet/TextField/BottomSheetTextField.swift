//
//  BottomSheetTextField.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 24/05/24.
//

import UIKit

class BottomSheetTextField: VerticalStackView {
    // MARK: - Public Properties
    
    var viewModel: BottomSheetTextFieldModel? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - UI Components
    
    private lazy var textField: TextField = {
        let view = TextField()
        view.cornerRadius = 10
        view.font = .preferredFont(forTextStyle: .body)
        view.backgroundColor = .secondarySystemBackground
        view.padding = .init(horizontal: 16, vertical: 0)
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .left
        view.numberOfLines = 1
        view.textColor = .secondaryLabel
        view.font = .preferredFont(forTextStyle: .subheadline)
        return view
    }()
    
    // MARK: - Configure
    
    override func configure() {
        super.configure()
        spacing = 4
    }
    
    override func configureHierarchy() {
        super.configureHierarchy()
        addArrangedSubviews([titleLabel, textField])
    }
    
    override func configureConstraints() {
        super.configureConstraints()
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    // MARK: - Update
    
    private func updateView() {
        titleLabel.text = viewModel?.label?.uppercased()
    }
}
