//
//  UserCell.swift
//  SwiftbookMessenger
//
//  Created by Николай Явтушенко on 10.02.2022.
//

import UIKit

class UserCell: UICollectionViewCell, SellConfiguringCell {
    
    static var reuseId = "UserCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure<U>(with value: U) where U : Hashable {
        print("what?")
    }
    
}
