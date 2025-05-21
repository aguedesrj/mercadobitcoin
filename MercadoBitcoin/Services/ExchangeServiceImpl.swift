//
//  ExchangeServiceImpl.swift
//  MercadoBitcoin
//
//

import Foundation
import Alamofire

class ExchangeServiceImpl: ExchangeService {
    private let apiKey: String
    private let baseURL = "https://rest.coinapi.io/v1/exchanges"

    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    // nesse ponto, dependendo da versão mínima de iOS suportada pela aplicação, podemos substituir o modelo baseado em callbacks por async/await
    func fetchExchanges(completion: @escaping (Result<[Exchange], Error>) -> Void) {
        let headers: HTTPHeaders = [
            "X-CoinAPI-Key": apiKey
        ]

        AF.request(baseURL, method: .get, headers: headers)
          .validate()
          .responseDecodable(of: [Exchange].self) { response in
              switch response.result {
              case .success(let exchanges):
                  completion(.success(exchanges))

              case .failure(let error):
                  completion(.failure(error))
              }
          }
    }
}
