//
//  UITableView+Reusable.swift
//  
//
//  Copyright (c) 2022 woongs All rights reserved.
//


import UIKit

extension UITableViewCell: Reusable { }

public extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(_ type: T.Type, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func registerFromNib<T: UITableViewCell>(_ cellClass: T.Type) where T: NibLoadable {
        let nib = UINib(nibName: cellClass.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerFromClass<T: UITableViewCell>(_ cellClass: T.Type) {
        register(cellClass, forCellReuseIdentifier: T.reuseIdentifier)
    }
}
