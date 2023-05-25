//
//  ExchangeDetailsViewModel.swift
//  MercadoBitcoin
//
//  Created by Felipe Giampaoli on 21/05/23.
//

import Foundation

protocol ExchangeDetailsViewModelProtocol: AnyObject {
    var exchangeName: String { get }
    var website: String { get }
    var startDate: String { get }
    var endDate: String { get }
    var quoteStartDate: String { get }
    var quoteEndDate: String { get }
    var orderbookStart: String { get }
    var orderbookEnd: String { get }
    var tradeStart: String { get }
    var tradeEnd: String { get }
    var symbolsCount: String { get }
    var hoursUSD: String { get }
    var daysUSD: String { get }
    var monthsUSD: String { get }
}

class ExchangeDetailsViewModel: ExchangeDetailsViewModelProtocol {

    private var exchange: Exchange

    init(exchange: Exchange) {
        self.exchange = exchange
    }

    var exchangeName: String {
        exchange.name ?? " - "
    }

    var website: String {
        exchange.website ?? " - "
    }

    var startDate: String {
        exchange.dataStart?.convertToDisplayFormat(mask: .short) ?? " - "
    }

    var endDate: String {
        exchange.dataEnd?.convertToDisplayFormat(mask: .short) ?? " - "
    }

    var quoteStartDate: String {
        exchange.dataQuoteStart?.convertToDisplayFormat(mask: .long) ?? " - "
    }

    var quoteEndDate: String {
        exchange.dataQuoteEnd?.convertToDisplayFormat(mask: .long) ?? " - "
    }

    var orderbookStart: String {
        exchange.dataOrderbookStart?.convertToDisplayFormat(mask: .long) ?? " - "
    }

    var orderbookEnd: String {
        exchange.dataOrderbookEnd?.convertToDisplayFormat(mask: .long) ?? " - "
    }

    var tradeStart: String {
        exchange.dataTradeStart?.convertToDisplayFormat(mask: .long) ?? " - "
    }

    var tradeEnd: String {
        exchange.dataTradeEnd?.convertToDisplayFormat(mask: .long) ?? " - "
    }

    var symbolsCount: String {
        "\(exchange.dataSymbolsCount ?? 0.0)"
    }

    var hoursUSD: String {
        "\((exchange.volume1HrsUsd ?? 0.0).toCurrency())"
    }

    var daysUSD: String {
        "\((exchange.volume1DayUsd ?? 0.0).toCurrency())"
    }

    var monthsUSD: String {
        "\((exchange.volume1MthUsd ?? 0.0).toCurrency())"
    }

}

