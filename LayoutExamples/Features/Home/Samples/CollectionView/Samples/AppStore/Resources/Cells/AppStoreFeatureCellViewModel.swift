//
//  AppStoreFeatureCellViewModel.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 07/07/24.
//

import Foundation

protocol AppStoreFeatureCellViewModelProtocol: CollectionCellViewModelProtocol {
    var tag: String { get }
    var title: String { get }
    var subtitle: String { get }
    var image: String { get }
}

struct AppStoreFeatureCellViewModel: AppStoreFeatureCellViewModelProtocol {
    
    // MARK: - Public Properties
    
    var tag: String
    var title: String
    var subtitle: String
    var image: String
    
    // MARK: - Init
    
    init(item: AppStoreModels.Section.Item) {
        self.tag = item.tag.uppercased()
        self.title = item.name
        self.subtitle = item.subheading
        self.image = item.image
    }
}
