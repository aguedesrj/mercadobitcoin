//
//  ExchangeListViewController.swift
//  MercadoBitcoin
//
//

import UIKit

class ExchangeListViewController: UIViewController {
    private let exchangeListView = ExchangeListView()
    private var viewModel: ExchangeListViewModelProtocol

    init(viewModel: ExchangeListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupBind()
        
        viewModel.fetchExchanges()
    }
    
    override func loadView() {
        super.loadView()
        self.view = exchangeListView
    }
}

extension ExchangeListViewController {
    private func setupNavigationBar() {
        self.navigationItem.title = "Exchanges"
        navigationController?.navigationBar.tintColor = .black
        
        let backItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
    }
    
    private func setupBind() {
        viewModel.success = { [weak self] result in
            self?.exchangeListView.configureView(exchanges: result, delegate: self)
        }
        
        viewModel.error = { [weak self] result in
            // nesse ponto, podemos exibir a mensagem de erro retornada pelo back-end ou optar por apresentar uma mensagem genérica.
            self?.showErrorAlert(message: "System unavailable, please try again later.")
        }
        
        viewModel.toggleLoading = { [weak self] isLoading in
            self?.exchangeListView.toggleLoading(isLoading: isLoading)
        }
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(
            UIAlertAction(title: "OK", style: .default, handler: nil)
        )
        present(alert, animated: true, completion: nil)
    }
}

extension ExchangeListViewController: ExchangeListViewDelegate {
    func onTappedExchange(exchange: Exchange) {
        viewModel.didSelectItem(at: exchange)
    }
}
