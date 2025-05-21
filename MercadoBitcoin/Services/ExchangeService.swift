//
//  ExchangeService.swift
//  MercadoBitcoin
//
//

import Combine

protocol ExchangeService {
    func fetchExchanges(completion: @escaping (Result<[Exchange], Error>) -> Void)
}
