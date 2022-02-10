//
//  UIViewController + Extension.swift
//  SwiftbookMessenger
//
//  Created by Николай Явтушенко on 10.02.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func configure<T: SellConfiguringCell, U: Hashable>(collectionView: UICollectionView,
                                                        cellType: T.Type,
                                                        with value: U,
                                                        indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId,
                                                            for: indexPath) as? T else {
            fatalError("Unable to dequere \(cellType)")
        }
        cell.configure(with: value)
        return cell
    }
}

