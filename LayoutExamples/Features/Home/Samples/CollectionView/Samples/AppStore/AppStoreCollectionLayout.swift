//
//  AppStoreCollectionLayout.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 06/07/24.
//

import UIKit

class AppStoreCollectionLayout: UICollectionViewCompositionalLayout {
    
    // MARK: - Init
    
    init(sections: [AppStoreModels.Section]) {
        super.init(
            sectionProvider: { (sectionIndex, layoutEnvironment) in
                Self.sectionProvider(sectionIndex: sectionIndex, layoutEnvironment: layoutEnvironment, sections: sections)
            },
            configuration: Self.providerConfiguration
        )
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Providers
    
    private static func sectionProvider(sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment, sections: [AppStoreModels.Section]) -> NSCollectionLayoutSection {
        let currentSection = sections[sectionIndex]
        switch currentSection.type {
        case .feature: return featureLayout()
        default: return mediumTableListLayout()
        }
    }
    
    private static var providerConfiguration: UICollectionViewCompositionalLayoutConfiguration {
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.interSectionSpacing = 20
        return configuration
    }
    
    // MARK: - Sections Layouts
    
    private static func featureLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(350))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
        
        return layoutSection
    }
    
    private static func mediumTableListLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.33))
        
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .fractionalHeight(0.55))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize, subitems: [layoutItem])
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
        
        return layoutSection
    }
}
