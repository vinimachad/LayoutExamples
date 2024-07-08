//
//  CollectionCellProtocol.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 06/07/24.
//

import UIKit

protocol CollectionCellViewModelProtocol { }

protocol CollectionCellProtocol: UICollectionViewCell {
    associatedtype Item = Hashable
    static var identifier: String { get }
    func bind(item: Item)
}
