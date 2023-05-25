//
//  Decimal+Extensions.swift
//  MercadoBitcoin
//
//  Created by Felipe Giampaoli on 21/05/23.
//

import Foundation

extension Decimal {

    func toCurrency() -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "en_US")

        let formattedValue = currencyFormatter.string(from: self as NSNumber)
        return formattedValue ?? "-"
    }
}
