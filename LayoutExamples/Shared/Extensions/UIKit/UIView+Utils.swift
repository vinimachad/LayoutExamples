//
//  UIView+Utils.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 03/05/24.
//

import UIKit

extension UIView {
    
    var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set {
            layer.masksToBounds = true
            layer.cornerRadius = newValue
        }
    }
    
    func setRounded() {
        cornerRadius = bounds.height / 2
    }
    
    func addShadow(radius: CGFloat = 0, opacity: Float = 0.2, color: UIColor = .black, pos: CGPoint = .zero) {
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = .zero
        layer.masksToBounds = false
        layer.shouldRasterize = true
        layer.shadowColor = color.cgColor
        layer.rasterizationScale = UIScreen.main.scale
        let rect = CGRect(x: bounds.origin.x + pos.x, y: bounds.origin.y + pos.y, width: bounds.width, height: bounds.height)
        layer.shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath
    }
    
    // MARK: - Subviews Methods
    
    func removeAllSubviews() {
        subviews.forEach { view in
            view.removeFromSuperview()
        }
    }
}

extension UIView {
    enum ContentPriority: Float {
        case veryLow = 800
        case low = 750
        case high = 250
        case veryHigh = 100
    }
    
    enum ContentResistancePriority: Float {
        case veryLow = 100
        case low = 250
        case high = 750
        case veryHigh = 800
    }
    
    // MARK: - Priorities
    
    /// Deve ser utilizado para definir a prioridade de expansão da View
    /// -  Parameters:
    ///    - priority: Se a prioridade for acima da prioridade da View concorrente, deve ser expandir, caso contrario não.
    ///    - axis: Responsável por definir o eixo da a prioridade escolhida.
    /// Exemplo de como pode ser implementado para expandir a view:
    /// ```swift
    ///     let stackView = UIStackView()
    ///     let buttonToExpand = UIButton()
    ///     let buttonToCompress = UIButton()
    ///
    ///     stackView.axis = .horizontal
    ///     stackView.addArrangedSubview(buttonToExpand)
    ///     stackView.addArrangedSubview(buttonToCompress)
    ///     buttonToExpand.setContentExpansionPriority(.high, .horizontal)
    ///     buttonToCompress.setContentExpansionPriority(.low, .horizontal)
    /// ```
    func setContentExpansionPriority(_ priority: ContentPriority, for axis: NSLayoutConstraint.Axis) {
        self.setContentHuggingPriority(.init(priority.rawValue), for: axis)
    }
    
    /// Deve ser utilizado juntamente com a prioridade da constraint desejada
    /// -  Parameters:
    ///    - priority: Se a prioridade de resistencia for acima da prioridade da constraint selecionada, o conteudo deve expandir, caso contrario não.
    ///    - axis: Responsável por definir o eixo da a prioridade escolhida.
    /// Exemplo de como pode ser implementado para expandir a view:
    /// ```swift
    ///     let button = UIButton()
    ///     let widthConstraint = button.widthAnchor.constraint(equalToConstant: 60)
    ///         widthConstraint.priority = .defaultLow
    ///         widthConstrain.isActive = true
    ///         button.setContentExpansionResistancePriority(.high, axis: .horizontal)
    /// ```
    func setContentExpansionResistancePriority(_ priority: ContentResistancePriority, for axis: NSLayoutConstraint.Axis) {
        self.setContentCompressionResistancePriority(.init(priority.rawValue), for: axis)
    }
}
