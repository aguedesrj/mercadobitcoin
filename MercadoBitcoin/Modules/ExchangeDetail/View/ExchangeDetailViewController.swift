//
//  ExchangeDetailViewController.swift
//  MercadoBitcoin
//
//

import UIKit

class ExchangeDetailViewController: UIViewController {
    var onDismiss: (() -> Void)?
    
    private let exchangeDetailView = ExchangeDetailView()
    
    private let viewModel: ExchangeDetailViewModel
    private let exchange: Exchange

    init(exchange: Exchange, viewModel: ExchangeDetailViewModel) {
        self.exchange = exchange
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = exchange.name
    }
    
    override func loadView() {
        super.loadView()
        self.view = exchangeDetailView
        
        exchangeDetailView.configureView(exchange: exchange)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if isMovingFromParent {
            onDismiss?()
        }
    }
}
