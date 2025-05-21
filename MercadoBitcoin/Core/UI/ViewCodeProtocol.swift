//
//  ViewCodeProtocol.swift
//  MercadoBitcoin
//
//

import Foundation

public protocol ViewCodeProtocol {
    func buildHierarchy()
    func setupConstraints()
    func setupExtraConfigurations()
}

public extension ViewCodeProtocol {
    func buildLayout() {
        buildHierarchy()
        setupConstraints()
        setupExtraConfigurations()
    }
}
