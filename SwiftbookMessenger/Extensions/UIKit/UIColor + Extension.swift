//
//  UIColor + Extension.swift
//  SwiftbookMessenger
//
//  Created by Николай Явтушенко on 02.02.2022.
//

import UIKit

extension UIColor {
    
    // Дополнительный инициализатор для HEX
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }

    //Методы с кастомными цветами
    static func buttonRed() -> UIColor {
        return UIColor(rgb: 0xD0021B)
    }
    
    static func buttonBlack() -> UIColor {
        return UIColor(rgb: 0x333333)
    }
    
    static func mainWhite() -> UIColor {
        return UIColor(rgb: 0xF7F8FD)
    }
    
    static func textFieldLight() -> UIColor {
        return UIColor(rgb: 0xE6E6E6)
    }
}
