//
//  Date+Extensions.swift
//  MercadoBitcoin
//
//  Created by Felipe Giampaoli on 21/05/23.
//

import Foundation

enum DateMask: String {
    case short = "yyyy-MM-dd"
    case long = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
}

extension Date {

    func convertToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }
}

extension String {
    func convertToDate(mask: DateMask) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = mask.rawValue
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current

        return dateFormatter.date(from: self)
    }

    func convertToDisplayFormat(mask: DateMask) -> String {
        guard let date = self.convertToDate(mask: mask) else { return "N/A" }
        return date.convertToString()
    }
}
