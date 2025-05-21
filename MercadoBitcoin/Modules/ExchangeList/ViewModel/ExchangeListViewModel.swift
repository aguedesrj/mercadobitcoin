//
//  ExchangeListViewModel.swift
//  MercadoBitcoin
//
//

import Foundation

protocol ExchangeListViewModelProtocol: AnyObject {
    // MARK: – Inputs
    func fetchExchanges()
    func didSelectItem(at exchange: Exchange)

    // MARK: – Outputs / Events
    var onSelectExchange: ((Exchange) -> Void)? { get set }
    var toggleLoading: ((Bool) -> Void)? { get set }
    var success: (([Exchange]) -> Void)? { get set }
    var error: ((Error) -> Void)? { get set }

    // MARK: – Estado
    var exchanges: [Exchange] { get }
}

class ExchangeListViewModel: ExchangeListViewModelProtocol {
    private let service: ExchangeService
    private(set) var exchanges: [Exchange] = []

    var onSelectExchange: ((Exchange) -> Void)?
    var toggleLoading: ((Bool) -> Void)?
    var success: (([Exchange]) -> Void)?
    var error: ((Error) -> Void)?
    
    init(service: ExchangeService) {
        self.service = service
    }
    
    func fetchExchanges() {
        self.toggleLoading?(true)
        
        service.fetchExchanges { result in
            self.toggleLoading?(false)
            
            switch result {
            case .success(let exchanges):
                self.exchanges = exchanges
                self.success?(exchanges)
            case .failure(let error):
                self.error?(error)
            }
        }
    }
    
    func didSelectItem(at exchange: Exchange) {
        onSelectExchange?(exchange)
    }
}
