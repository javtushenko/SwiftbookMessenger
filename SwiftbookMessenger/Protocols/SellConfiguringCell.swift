//
//  SellConfiguringCell.swift
//  SwiftbookMessenger
//
//  Created by Николай Явтушенко on 10.02.2022.
//

import Foundation

protocol SellConfiguringCell {
    static var reuseId: String { get }
    func configure(with value: MChat)
}
