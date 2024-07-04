//
//  CollectionViewSamplesModel.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 03/07/24.
//

import Foundation

enum CollectionViewSamplesModel {
    enum Item: CaseIterable, GridLayoutItem {
        case appStore
        
        var title: String {
            switch self {
            case .appStore: return "App Store"
            }
        }
    }
}
