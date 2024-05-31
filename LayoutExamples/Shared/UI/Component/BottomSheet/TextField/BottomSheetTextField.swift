//
//  BottomSheetTextField.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 24/05/24.
//

import UIKit

class BottomSheetTextField: VerticalStackView {
    
    // MARK: - Public Properties
    
    var onMoveTextField: Completion<CGFloat>?
    var viewModel: BottomSheetTextFieldModel? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - UI Components
    
    private lazy var textField: TextField = {
        let view = TextField()
        view.cornerRadius = 10
        view.delegate = self
        view.font = .preferredFont(forTextStyle: .body)
        view.backgroundColor = .secondarySystemBackground
        view.padding = .init(horizontal: 16, vertical: 0)
        view.addTarget(self, action: #selector(didEditingChange), for: .editingChanged)
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
    
    private lazy var supportingTextLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .left
        view.numberOfLines = 2
        view.textColor = .tertiaryLabel
        view.font = .preferredFont(forTextStyle: .footnote)
        return view
    }()
    
    // MARK: - Configure
    
    override func configure() {
        super.configure()
        spacing = 4
    }
    
    override func configureHierarchy() {
        super.configureHierarchy()
        addArrangedSubviews([titleLabel, textField, supportingTextLabel])
    }
    
    override func configureConstraints() {
        super.configureConstraints()
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    // MARK: - Update
    
    private func updateView() {
        guard let viewModel else { return }
        titleLabel.text = viewModel.label?.uppercased()
        textField.keyboardType = viewModel.keyboardType
        supportingTextLabel.text = viewModel.supportingText
    }
    
    // MARK: - Actions
    
    @objc private func didEditingChange(sender: TextField) {
        guard let text = sender.text else { return }
        viewModel?.onTextChange?(text)
    }
}

extension BottomSheetTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        onMoveTextField?(250)
    }
    
    // Finish Editing The Text Field
    func textFieldDidEndEditing(_ textField: UITextField) {
        onMoveTextField?(-250)
    }
    
    // Hide the keyboard when the return key pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
