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
        let label = "com.LayouExamples.set-image-\(UUID().uuidString)"
        let queue = DispatchQueue(label: label, qos: .default)
        
        image = placeholder
        queue.async {
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
    }
}

