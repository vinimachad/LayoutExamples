//
//  BottomSheetTextFieldModel.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 23/05/24.
//

import UIKit

struct BottomSheetTextFieldModel {
    var name: String
    var label: String? = nil
    var placeholder: String? = nil
    var supportingText: String? = nil
    var keyboardType: UIKeyboardType = .default
    var required: Bool = false
    var onTextChange: Completion<String>? = nil
}
