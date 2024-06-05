//
//  GridCollectionView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 04/05/24.
//

import UIKit

public protocol GridLayoutItem {
    var title: String { get }
}

protocol GridCollectionViewDelegate<Item>: AnyObject {
    associatedtype Item = GridLayoutItem
    func didSelect(at row: Int, with item: Item)
}

protocol GridCollectionViewProtocol<Item>: UIView {
    associatedtype Item = GridLayoutItem
    var delegate: (any GridCollectionViewDelegate<Item>)? { get set }
    func bindIn(items: [Item])
}

open class GridCollectionView<T: GridLayoutItem>: UIView, GridCollectionViewProtocol, UICollectionViewDelegate, UICollectionViewDataSource {

    typealias Item = T
    
    // MARK: - Public properties
    
    weak var delegate: (any GridCollectionViewDelegate<Item>)?
    
    // MARK: - Private properties
    
    private var items: [T] = []
    private var collectionViewFlowLayout: GridCollectionFlowLayout
    
    // MARK: - UI Components
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        view.dataSource = self
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.register(BoxCollectionViewCell.self, forCellWithReuseIdentifier: BoxCollectionViewCell.identifier)
        return view
    }()
    
    // MARK: - Init
    
    init() {
        collectionViewFlowLayout = GridCollectionFlowLayout()
        super.init(frame: .zero)
        configure()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        collectionViewFlowLayout = GridCollectionFlowLayout()
        super.init(coder: coder)
    }
    
    func bindIn(items: [T]) {
        self.items = items
        collectionView.reloadData()
    }
    
    // MARK: - Configurations
    
    private func configure() {
        collectionView.delegate = self
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    // MARK: - UICollectionViewDelegate & UICollectionViewDataSource
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoxCollectionViewCell.identifier, for: indexPath) as? BoxCollectionViewCell
        else { return UICollectionViewCell() }
        
        cell.bindIn(item: items[indexPath.row])
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = indexPath.row
        let item = items[row]
        delegate?.didSelect(at: row, with: item)
    }
}
