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
