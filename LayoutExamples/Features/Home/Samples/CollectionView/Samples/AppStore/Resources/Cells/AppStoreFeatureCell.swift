//
//  AppStoreFeatureCell.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 06/07/24.
//

import UIKit

final class AppStoreFeatureCell: UICollectionViewCell, CollectionCellProtocol, ConfigurableView {
    
    // MARK: - UI Components
    
    private(set) lazy var labelGroup: VerticalStackView = {
        let view = VerticalStackView()
        view.spacing = 2
        view.horizontalAlignment = .fill
        view.heightDistribution = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var tagLabel: UILabel = {
        let view = UILabel()
        view.font = .setFont(.caption1, weight: .bold)
        view.textColor = .systemBlue
        return view
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = .setFont(.title2)
        view.textColor = .label
        return view
    }()
    
    private(set) lazy var subtitleLabel: UILabel = {
        let view = UILabel()
        view.font = .setFont(.title2)
        view.textColor = .secondaryLabel
        return view
    }()
    
    private(set) lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.cornerRadius = 5
        view.backgroundColor = .lightGray
        return view
    }()
    
    
    // MARK: Public Properties
    
    static var identifier: String {
        String(describing: AppStoreFeatureCell.self)
    }
    
    // MARK: - Private Properties
    
    private var viewModel: AppStoreFeatureCellViewModelProtocol?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    // MARK: - Bind
    
    func bind(item: AppStoreModels.Section.Item) {
        viewModel = AppStoreFeatureCellViewModel(item: item)
        tagLabel.text = viewModel?.tag
        titleLabel.text = viewModel?.title
        subtitleLabel.text = viewModel?.subtitle
    }
    
    // MARK: - Configure
    
    func configure() {
        backgroundColor = .systemBackground
        configureHierarchy()
        configureConstraints()
    }
    
    func configureHierarchy() {
        labelGroup.addArrangedSubviews([tagLabel, titleLabel, subtitleLabel, imageView])
        contentView.addSubview(labelGroup)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            labelGroup.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            labelGroup.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            labelGroup.topAnchor.constraint(equalTo: contentView.topAnchor),
            labelGroup.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
