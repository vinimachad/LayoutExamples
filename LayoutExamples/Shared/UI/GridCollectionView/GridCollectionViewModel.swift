//
//  GridCollectionViewModel.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 03/07/24.
//

import Foundation

protocol GridCollectionViewModelProtocol<Item> {
    associatedtype Item = GridLayoutItem & CaseIterable
    var items: [Item] { get }
}

final class GridCollectionViewModel<Item: GridLayoutItem & CaseIterable>: GridCollectionViewModelProtocol {
    var items: [Item] {
        guard let items = Item.allCases as? [Item] else {
            return []
        }
        
        return items
    }
}
