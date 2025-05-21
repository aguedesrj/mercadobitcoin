//
//  UIViews+Extensions.swift
//  MercadoBitcoin
//
//

import UIKit

extension UIView {
    func layout(using constraints: [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
}
