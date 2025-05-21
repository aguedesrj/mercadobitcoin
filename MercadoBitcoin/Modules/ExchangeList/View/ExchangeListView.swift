//
//  ExchangeListView.swift
//  MercadoBitcoin
//
//

import UIKit

protocol ExchangeListViewDelegate: AnyObject {
    func onTappedExchange(exchange: Exchange)
}

final class ExchangeListView: UIViewCode {
    
    private let cellIdentifier = "defaultCell"
    private var exchanges: [Exchange] = []
    
    weak var delegate: ExchangeListViewDelegate?
    
    // MARK: - Components
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ExchangeViewCell.self,
                           forCellReuseIdentifier: cellIdentifier)
        tableView.accessibilityIdentifier = "exchangeListTableView"
        return tableView
    }()
    
    // MARK: - LifeCycle
    override func buildHierarchy() {
        addSubview(tableView)
        addSubview(activityIndicator)
    }
    
    override func setupConstraints() {
        tableView.layout(using: [
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
        activityIndicator.layout(using: [
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override func setupExtraConfigurations() {
        backgroundColor = .white
    }
}

extension ExchangeListView {
    func configureView(exchanges: [Exchange], delegate: ExchangeListViewDelegate?) {
        self.delegate = delegate
        self.exchanges = exchanges
        
        self.tableView.reloadData()
    }
    
    func toggleLoading(isLoading: Bool) {
        if !isLoading {
            activityIndicator.stopAnimating()
            return
        }
        activityIndicator.startAnimating()
    }
}

extension ExchangeListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exchanges.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let exchange = exchanges[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ExchangeViewCell
        
        cell?.configureView(exchange: exchange)
        cell?.selectionStyle = .none
        
        return cell ?? UITableViewCell()
    }
}

extension ExchangeListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let exchange = exchanges[indexPath.row]
        delegate?.onTappedExchange(exchange: exchange)
    }
}
