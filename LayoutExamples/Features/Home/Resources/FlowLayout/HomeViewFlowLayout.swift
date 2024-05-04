//
//  HomeViewFlowLayout.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 02/05/24.
//

import Foundation
import UIKit

class HomeViewFlowLayout: UICollectionViewFlowLayout {
        
    // MARK: - Constant's
    
    private let kMargin: CGFloat = 16
    private var kNumberOfColumns: CGFloat = 2
    
    // MARK: - Private properties
    
    private var collectionViewSize: CGSize {
        guard let collectionView else { return .zero }
        let bounds = collectionView.bounds
        let width = bounds.width - ((kMargin * kNumberOfColumns) + minimumInteritemSpacing)
        return .init(width: width, height: bounds.height)
    }
    
    private var contentWidth: CGFloat {
        return collectionViewSize.width / CGFloat(kNumberOfColumns)
    }
    
    // MARK: - Life cycle
    
    override func prepare() {
        super.prepare()
        scrollDirection = .vertical
        minimumLineSpacing = kMargin
        minimumInteritemSpacing = kMargin
        sectionInset = UIEdgeInsets(top: kMargin, left: kMargin, bottom: kMargin, right: kMargin)
        itemSize = CGSize(width: contentWidth, height: contentWidth)
    }
}
