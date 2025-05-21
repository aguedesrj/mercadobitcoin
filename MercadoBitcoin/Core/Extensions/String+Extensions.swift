//
//  String+Extensions.swift
//  MercadoBitcoin
//
//

import Foundation

extension String {
    func toAmericanDateString() -> String {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        isoFormatter.timeZone = TimeZone(secondsFromGMT: 0)

        guard let date = isoFormatter.date(from: self) else { return "" }

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "MM/dd/yyyy HH:mm:ss"
        outputFormatter.locale = Locale(identifier: "en_US_POSIX")
        outputFormatter.timeZone = TimeZone(secondsFromGMT: 0)

        return outputFormatter.string(from: date)
    }
}
