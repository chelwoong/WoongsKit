//
//  UITableView+Reusable.swift
//  
//
//  Copyright (c) 2022 woongs All rights reserved.
//


import UIKit

extension UICollectionViewCell: Reusable { }

public extension UICollectionView {
    
    func dequeueReusableCell<T: UICollectionViewCell>(_ type: T.Type, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func registerFromNib<T: UICollectionViewCell>(_ cellClass: T.Type) where T: NibLoadable {
        let nib = UINib(nibName: cellClass.nibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerFromClass<T: UICollectionViewCell>(_ cellClass: T.Type) {
        register(cellClass, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
}

