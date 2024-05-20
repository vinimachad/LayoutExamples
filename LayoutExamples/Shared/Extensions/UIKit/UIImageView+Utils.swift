//
//  UIImageView+Utils.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 15/05/24.
//

import UIKit

extension UIImageView {
    
    func setImage(from urlString: String, placeholder: UIImage? = nil) {
        guard let url = URL(string: urlString) else { return }
        image = placeholder
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
           DispatchQueue.main.async {
                self.image = UIImage(data: data)
           }
        }
    }
}
