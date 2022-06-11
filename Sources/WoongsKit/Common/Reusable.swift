//
//  Reusable.swift
//
//  Copyright (c) 2022 woongs All rights reserved.
//


import UIKit

public protocol Reusable: AnyObject { }

public extension Reusable where Self: UIView {
    
    static var reuseIdentifier: String {
        return "\(self)"
    }
}

// MARK: - NibLoadable
protocol NibLoadable: AnyObject { }

public extension NibLoadable where Self: UIView {
    
    static var nibName: String {
        return "\(self)"
    }
    
    static func createFromNib(bundle: Bundle? = nil) -> Self? {
        let nib = UINib(nibName: Self.nibName, bundle: bundle).instantiate(withOwner: self, options: nil)
        return nib.first as? Self
    }
}

// MARK: - UITableViewCell, UITableView
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

// MARK: - UICollectionViewCell, UICollectionView
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

