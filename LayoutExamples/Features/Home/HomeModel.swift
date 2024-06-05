//
//  HomeModel.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 01/05/24.
//

import UIKit

enum HomeModel {
    struct Item {
        enum Name: CaseIterable, GridLayoutItem {
            case stackView
            case collectionView
            case tableView
            
            var title: String {
                switch self {
                case .stackView: return "StackView"
                case .collectionView: return "CollectionView"
                case .tableView: return "TableView"
                }
            }
        }
    }
}
