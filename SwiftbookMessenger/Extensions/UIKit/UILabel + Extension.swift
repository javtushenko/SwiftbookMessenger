//
//  UILabel + Extension.swift
//  SwiftbookMessenger
//
//  Created by Николай Явтушенко on 02.02.2022.
//

import UIKit

extension UILabel {
    
    convenience init(text: String,
                     font: UIFont? = .avenir20()){
        
        self.init()
        self.text = text
        self.font = font
        
    }
}
