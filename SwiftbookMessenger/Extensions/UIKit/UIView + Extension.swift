//
//  UIView + Extension.swift
//  SwiftbookMessenger
//
//  Created by Николай Явтушенко on 11.02.2022.
//

import UIKit

extension UIView {
    
    func apllyGradients(cornerRadius: CGFloat) {
        self.backgroundColor = nil
        self.layoutIfNeeded()
        let gradientView = GradientView(from: .topTrailing,
                                        to: .bottomLeading,
                                        startColor: UIColor(rgb: 0xC9A1F0),
                                        endColor: UIColor(rgb: 0x7AB2EB))
        if let gradientLayer = gradientView.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = self.bounds
            gradientLayer.cornerRadius = cornerRadius
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
    
}
