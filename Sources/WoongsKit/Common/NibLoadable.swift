//
//  NibLoadable.swift
//  
//
//  Copyright (c) 2022 woongs All rights reserved.
//


import UIKit

public protocol NibLoadable: AnyObject { }

public extension NibLoadable where Self: UIView {
    
    static var nibName: String {
        return "\(self)"
    }
    
    static func createFromNib(bundle: Bundle? = nil) -> Self? {
        let nib = UINib(nibName: Self.nibName, bundle: bundle).instantiate(withOwner: self, options: nil)
        return nib.first as? Self
    }
}
