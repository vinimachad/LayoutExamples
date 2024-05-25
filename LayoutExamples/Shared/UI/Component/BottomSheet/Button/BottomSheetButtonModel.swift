//
//  BottomSheetButtonModel.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 23/05/24.
//

import UIKit

struct BottomSheetButtonModel {
    var name: String
    var label: String? = nil
    var role: UIButton.Role = .normal
    var configuration: UIButton.Configuration = .filled()
    var action: Completion<Any>
}
