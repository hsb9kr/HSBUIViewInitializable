//
//  UIViewInitializable.swift
//  HSBUIViewInitializable
//
//  Created by 홍상보 on 03/07/2019.
//  Copyright © 2019 binaryrocket. All rights reserved.
//

import UIKit

public protocol UIViewInitializable {
    static var identifier: String { get }
}

public extension UIViewInitializable where Self: UIView {
    static var identifier: String {
        return String(describing: Self.self)
    }
    
    static func loadFromNib() -> Self {
        return nib().instantiate(withOwner: self, options: nil).first as! Self
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
