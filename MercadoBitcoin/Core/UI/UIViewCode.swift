//
//  UIViewCode.swift
//  MercadoBitcoin
//
//

import UIKit

open class UIViewCode: UIView, ViewCodeProtocol {
    public init() {
        super.init(frame: .zero)
        buildLayout()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        buildLayout()
    }

    open func buildHierarchy() {
        fatalError()
    }

    open func setupConstraints() {
        fatalError()
    }

    open func setupExtraConfigurations() {}
}
