//
//  SplashViewModel.swift
//  MercadoBitcoin
//
//

import Foundation

protocol SplashViewModelProtocol {
    // MARK: – Inputs
    func start()
    
    // MARK: – Outputs / Events
    var onFinish: (() -> Void)? { get set }
}

class SplashViewModel: SplashViewModelProtocol {
    
    var onFinish: (() -> Void)?
    
    func start() {
        // TODO aqui chamaria alguma API ou algum outro processo, caso for necessário...
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            self.onFinish?()
        }
    }
}
