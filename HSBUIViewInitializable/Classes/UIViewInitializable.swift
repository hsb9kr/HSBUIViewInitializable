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
        return UINib(nibName: identifier, bundle: nil).instantiate(withOwner: self, options: nil).first as! Self
    }
	
	func loadViewFromNib() -> Self {
		let bundle = Bundle(for: type(of: self))
		let nib = UINib(nibName: identifier, bundle: bundle)
		return nib.instantiate(withOwner: self, options: nil).first as! Self
	}
}
