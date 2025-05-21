//
//  SplashView.swift
//  MercadoBitcoin
//
//

import UIKit

final class SplashView: UIViewCode {
    
    private let logo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        return image
    }()
    
    // MARK: - LifeCycle
    override func buildHierarchy() {
        addSubview(logo)
    }
    
    override func setupConstraints() {
        logo.layout(using: [
            logo.centerXAnchor.constraint(equalTo: centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    override func setupExtraConfigurations() {
        backgroundColor = .white
    }
}
