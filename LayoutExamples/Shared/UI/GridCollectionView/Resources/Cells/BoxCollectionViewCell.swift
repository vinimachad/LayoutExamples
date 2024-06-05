//
//  BoxCollectionViewCell.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 01/05/24.
//

import UIKit

class BoxCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Public properties
    
    static var identifier: String {
        String(describing: self)
    }
    
    // MARK: - UI Components
    
    private lazy var title: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .center
        return view
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - BindIn
    
    func bindIn(item: GridLayoutItem) {
        title.text = item.title
    }
    
    // MARK: - Configure
    
    private func configure() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 8
        layer.masksToBounds = true
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        contentView.addSubview(title)
        configureConstraints()
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            title.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
}
