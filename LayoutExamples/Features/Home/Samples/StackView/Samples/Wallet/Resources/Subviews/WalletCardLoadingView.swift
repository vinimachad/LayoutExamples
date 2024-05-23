//
//  WalletCardLoadingView.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 22/05/24.
//

import UIKit
import SkeletonView

class WalletCardLoadingView: VerticalStackView, Skeletonable {
    
    // MARK: - UI Components
    
    private func headerView() -> HorizontalStackView {
        let kSize = 40.0
        let view = HorizontalStackView()
        let avatarIcon = createFakeView(width: kSize, height: kSize)
        let nameLabel: UILabel = createFakeView(height: kSize)
        let menuIcon = createFakeView(width: kSize, height: kSize)
        nameLabel.numberOfLines = 2
        nameLabel.skeletonPaddingInsets = .init(top: 0, left: 0, bottom: 0, right: 90)
        view.widthDistribution = .equalSpacing
        view.verticalAlignment = .center
        view.isSkeletonable = true
        view.addArrangedSubviews([avatarIcon, nameLabel, menuIcon])
        view.setCustomSpacing(8, after: avatarIcon, relation: .equal)
        return view
    }
    
    private func balanceView() -> VerticalStackView {
        let view = VerticalStackView()
        let overallLabel = createFakeView(width: 100, height: 20)
        let balanceValueLabel = createFakeView(height: 70)
        view.isSkeletonable = true
        view.spacing = 8
        view.horizontalAlignment = .leading
        view.addArrangedSubviews([overallLabel, balanceValueLabel])
        balanceValueLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        balanceValueLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        return view
    }
    
    private func cardView() -> UIView {
        createFakeView(height: 150)
    }
    
    private func quotesView() -> UIView {
        createFakeView(height: 85)
    }
    
    private func menuView() -> HorizontalStackView {
        let kSize = 60.0
        let view = HorizontalStackView()
        let addMenuView = createFakeView(width: kSize, height: kSize)
        let scanMenuView = createFakeView(width: kSize, height: kSize)
        let paymentButton = createFakeView(height: kSize)
        view.spacing = 16
        view.verticalAlignment = .fill
        view.widthDistribution = .fill
        view.isSkeletonable = true
        view.addArrangedSubviews([addMenuView, scanMenuView, paymentButton])
        return view
    }
    
    // MARK: - Configure
    
    override func configure() {
        super.configure()
        isSkeletonable = true
        spacing = 32
        heightDistribution = .fill
        horizontalAlignment = .fill
        let color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7508503401)
        showAnimatedGradientSkeleton(usingGradient: .init(baseColor: color))
        layoutMargins = .init(edges: 16)
    }
    
    override func configureHierarchy() {
        addArrangedSubviews([headerView(), balanceView(), cardView(), quotesView(), menuView()])
    }
}
