//
//  HomeView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 01/05/24.
//

import UIKit

protocol HomeViewProtocol: UIView {
    var delegate: HomeViewDelegate? { get set }
    func bindIn(items: [HomeModel.Item.Name])
}

protocol HomeViewDelegate: AnyObject {
    func didSelect(at row: Int, with item: HomeModel.Item.Name)
}

class HomeView: UIView, HomeViewProtocol {
    
    // MARK: - Public properties
    
    weak var delegate: HomeViewDelegate?
    
    // MARK: - Private properties
    
    private var items: [HomeModel.Item.Name] = []
    private var collectionViewFlowLayout: HomeViewFlowLayout

    // MARK: - UI Components
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        view.dataSource = self
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        view.register(BoxCollectionViewCell.self, forCellWithReuseIdentifier: BoxCollectionViewCell.identifier)
        return view
    }()
    
    // MARK: - Init
    
    init() {
        collectionViewFlowLayout = HomeViewFlowLayout()
        super.init(frame: .zero)
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        collectionViewFlowLayout = HomeViewFlowLayout()
        super.init(coder: coder)
    }
    
    func bindIn(items: [HomeModel.Item.Name]) {
        self.items = items
        collectionView.reloadData()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
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
}

// MARK: - UICollectionViewDelegate & UICollectionViewDataSource

extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoxCollectionViewCell.identifier, for: indexPath) as? BoxCollectionViewCell 
        else { return UICollectionViewCell() }
        
        cell.bindIn(item: items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = indexPath.row
        let item = items[row]
        delegate?.didSelect(at: row, with: item)
    }
}
