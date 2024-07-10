//
//  AppStoreView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 05/07/24.
//

import UIKit

final class AppStoreView: UIView, ConfigurableView {
    
    // MARK: - UI Components
    
    private(set) lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentInset = .init(top: 16)
        return view
    }()
    
    // MARK: - Private Properties
    
    private var sections: [AppStoreModels.Section] = []
    private var dataSource: AppStoreCollectionDataSource? {
        didSet {
            collectionView.dataSource = dataSource
            reloadData()
        }
    }
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    // MARK: - Binds
    
    func bind(sections: [AppStoreModels.Section]) {
        self.sections = sections
        collectionView.collectionViewLayout = AppStoreCollectionLayout(sections: sections)
        dataSource = AppStoreCollectionDataSource(collectionView: collectionView, sections: sections)
    }
    
    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<AppStoreModels.Section, AppStoreModels.Section.Item>()
        snapshot.appendSections(sections)
        
        for section in sections {
            snapshot.appendItems(section.items, toSection: section)
        }
        
        dataSource?.apply(snapshot)
    }
    
    // MARK: - Configure
    
    func configure() {
        configureHierarchy()
        configureConstraints()
    }
    
    func configureHierarchy() {
        addSubview(collectionView)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension AppStoreView: UICollectionViewDelegate { }
