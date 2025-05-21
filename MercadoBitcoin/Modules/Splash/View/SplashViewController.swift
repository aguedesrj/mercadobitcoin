//
//  SplashViewController.swift
//  MercadoBitcoin
//
//

import UIKit

class SplashViewController: UIViewController {
    private let splashView = SplashView()
    private let viewModel: SplashViewModelProtocol

    init(viewModel: SplashViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.start()
    }
    
    override func loadView() {
        super.loadView()
        self.view = splashView
    }
}
