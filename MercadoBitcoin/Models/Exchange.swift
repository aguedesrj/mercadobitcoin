//
//  Exchange.swift
//  MercadoBitcoin
//
//

import Foundation

struct Exchange: Codable {
    let name: String?
    let exchangeId: String?
    let dataTradeStart: String?
    let dataTradeEnd: String?
    let volumeOneHrsUsd: Double?
    let volumeOneDayUsd: Double?
    let volumeOneMthUsd: Double?
    
    enum CodingKeys: String, CodingKey {
        case name
        case exchangeId = "exchange_id"
        case dataTradeStart = "data_trade_start"
        case dataTradeEnd = "data_trade_end"
        case volumeOneHrsUsd = "volume_1hrs_usd"
        case volumeOneDayUsd = "volume_1day_usd"
        case volumeOneMthUsd = "volume_1mth_usd"
    }
}
