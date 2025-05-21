//
//  Double+Extensions.swift
//  MercadoBitcoin
//
//

import Foundation

extension Double {
    func toCurrencyString(localeIdentifier: String = "en_US") -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: localeIdentifier)
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
