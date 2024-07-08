//
//  AppStoreCollectionDataSource.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 06/07/24.
//

import UIKit

class AppStoreCollectionDataSource: UICollectionViewDiffableDataSource<AppStoreModels.Section, AppStoreModels.Section.Item>  {
    
    // MARK: - Private Properties
    
    private var collectionView: UICollectionView
    
    // MARK: - Init
    
    init(collectionView: UICollectionView, sections: [AppStoreModels.Section]) {
        self.collectionView = collectionView
        super.init(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            Self.cellProvider(collectionView: collectionView, indexPath: indexPath, item: item, sections: sections)
        })
    }
    
    // MARK: - Computed Properties
    
    private static func cellProvider(collectionView: UICollectionView, indexPath: IndexPath, item: AppStoreModels.Section.Item, sections: [AppStoreModels.Section]) -> UICollectionViewCell? {
        let currentSection = sections[indexPath.section]
        switch currentSection.type {
        case .feature: return Self.bind(AppStoreFeatureCell.self, item: item, indexPath: indexPath, collectionView: collectionView)
        default: return Self.bind(AppStoreFeatureCell.self, item: item, indexPath: indexPath, collectionView: collectionView)
        }
    }
    
    private static func bind<Cell: CollectionCellProtocol>(_ cellType: Cell.Type, item: Cell.Item, indexPath: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell {
        collectionView.register(cellType, forCellWithReuseIdentifier: cellType.identifier)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.identifier, for: indexPath) as? Cell else {
            return UICollectionViewCell()
        }
        
        cell.bind(item: item)
        return cell
    }
}
