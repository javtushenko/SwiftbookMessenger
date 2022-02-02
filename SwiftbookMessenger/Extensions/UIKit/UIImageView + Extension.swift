//
//  UIImageView + Extension.swift
//  SwiftbookMessenger
//
//  Created by Николай Явтушенко on 02.02.2022.
//

import UIKit

extension UIImageView {
    
    convenience init(image: UIImage?,
                     contentMode: UIView.ContentMode){
        
        self.init()
        self.image = image
        self.contentMode = contentMode
    }
    
}
