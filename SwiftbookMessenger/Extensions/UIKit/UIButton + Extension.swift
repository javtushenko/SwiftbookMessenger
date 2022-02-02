//
//  UIButton + Extension.swift
//  SwiftbookMessenger
//
//  Created by Николай Явтушенко on 02.02.2022.
//

import UIKit

// Кастомный инициализатор для Button

extension UIButton{
    
    convenience init(isShadow: Bool = false,
                     titleColor: UIColor,
                     title: String,
                     backgroundcolor: UIColor,
                     font: UIFont? = .avenir20(),
                     cornerRadius: CGFloat = 4) {
        
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundcolor
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerRadius
        
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
    }
}
