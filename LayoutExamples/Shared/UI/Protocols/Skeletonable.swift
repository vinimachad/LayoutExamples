//
//  Skeletonable.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 22/05/24.
//

import UIKit

protocol Skeletonable {
    func createFakeView<View: UIView>(width: CGFloat?, height: CGFloat?) -> View
    func createFakeLabelView(width: CGFloat?, height: CGFloat?, lines: Int) -> UILabel
}

extension Skeletonable where Self: UIView {
    func createFakeView<View: UIView>(width: CGFloat? = nil, height: CGFloat? = nil) -> View {
        let view = View()
        view.isSkeletonable = true
        view.skeletonCornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        if let width { view.widthAnchor.constraint(equalToConstant: width).isActive = true}
        if let height { view.heightAnchor.constraint(equalToConstant: height).isActive = true }
        
        return view
    }
    
    func createFakeLabelView(width: CGFloat? = nil, height: CGFloat? = nil, lines: Int = 2) -> UILabel {
        let view: UILabel = createFakeView(width: width, height: height)
        view.numberOfLines = lines
        return view
    }
}
