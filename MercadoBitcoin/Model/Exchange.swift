//
//  Exchange.swift
//  MercadoBitcoin
//
//  Created by Felipe Giampaoli on 21/05/23.
//

import Foundation

struct Exchange: Codable, Equatable {

    init(exchangeID: String?,
    website: String?,
    name: String?,
    dataStart: String?,
    dataEnd: String?,
    dataQuoteStart: String?,
    dataQuoteEnd: String?,
    dataOrderbookStart: String?,
    dataOrderbookEnd: String?,
    dataTradeStart: String?,
    dataTradeEnd: String?,
    dataSymbolsCount: Decimal?,
    volume1HrsUsd: Decimal?,
    volume1DayUsd: Decimal?,
    volume1MthUsd: Decimal?) {
        self.exchangeID = exchangeID
        self.website = website
        self.name = name
        self.dataStart = dataStart
        self.dataEnd = dataEnd
        self.dataQuoteStart = dataQuoteStart
        self.dataQuoteEnd = dataQuoteEnd
        self.dataOrderbookStart = dataOrderbookStart
        self.dataOrderbookEnd = dataOrderbookEnd
        self.dataTradeStart = dataTradeStart
        self.dataTradeEnd = dataTradeEnd
        self.dataSymbolsCount = dataSymbolsCount
        self.volume1HrsUsd = volume1HrsUsd
        self.volume1DayUsd = volume1DayUsd
        self.volume1MthUsd = volume1MthUsd
    }

    let exchangeID: String?
    let website: String?
    let name: String?
    let dataStart: String?
    let dataEnd: String?
    let dataQuoteStart: String?
    let dataQuoteEnd: String?
    let dataOrderbookStart: String?
    let dataOrderbookEnd: String?
    let dataTradeStart: String?
    let dataTradeEnd: String?
    let dataSymbolsCount: Decimal?
    let volume1HrsUsd: Decimal?
    let volume1DayUsd: Decimal?
    let volume1MthUsd: Decimal?

    enum CodingKeys: String, CodingKey {
        case exchangeID = "exchange_id"
        case website, name
        case dataStart = "data_start"
        case dataEnd = "data_end"
        case dataQuoteStart = "data_quote_start"
        case dataQuoteEnd = "data_quote_end"
        case dataOrderbookStart = "data_orderbook_start"
        case dataOrderbookEnd = "data_orderbook_end"
        case dataTradeStart = "data_trade_start"
        case dataTradeEnd = "data_trade_end"
        case dataSymbolsCount = "data_symbols_count"
        case volume1HrsUsd = "volume_1hrs_usd"
        case volume1DayUsd = "volume_1day_usd"
        case volume1MthUsd = "volume_1mth_usd"
    }
}
