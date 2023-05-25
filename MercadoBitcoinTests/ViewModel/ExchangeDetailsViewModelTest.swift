//
//  ExchangeDetailsViewModelTest.swift
//  MercadoBitcoinTests
//
//  Created by Felipe Giampaoli on 25/05/23.
//

import XCTest
@testable import MercadoBitcoin

final class ExchangeDetailsViewModelTest: XCTestCase {

    var sut: ExchangeDetailsViewModel!

    override func tearDownWithError() throws {
        sut = nil
    }

    func testViewModelInit() {
        // GIVEN
        let exchange = createExchange()
        let sut = ExchangeDetailsViewModel(exchange: exchange)

        // THEN
        XCTAssertNotNil(sut)
    }

    func testViewModelValues() {
        // GIVEN

        let exchange = createExchange()
        let sut = ExchangeDetailsViewModel(exchange: exchange)

        // THEN
        XCTAssertEqual(sut.exchangeName, exchange.name)
        XCTAssertEqual(sut.website, exchange.website)
        XCTAssertEqual(sut.startDate, formatDate(exchange.dataStart, mask: .short))
        XCTAssertEqual(sut.endDate, formatDate(exchange.dataEnd, mask: .short))
        XCTAssertEqual(sut.quoteStartDate, formatDate(exchange.dataQuoteStart, mask: .long))
        XCTAssertEqual(sut.quoteEndDate, formatDate(exchange.dataQuoteEnd, mask: .long))
        XCTAssertEqual(sut.orderbookStart, formatDate(exchange.dataOrderbookStart, mask: .long))
        XCTAssertEqual(sut.orderbookEnd, formatDate(exchange.dataOrderbookEnd, mask: .long))
        XCTAssertEqual(sut.tradeStart, formatDate(exchange.dataTradeStart, mask: .long))
        XCTAssertEqual(sut.tradeEnd, formatDate(exchange.dataTradeEnd, mask: .long))
        XCTAssertEqual(sut.symbolsCount, "\(exchange.dataSymbolsCount!)")
        XCTAssertEqual(sut.hoursUSD, formatCurrency(exchange.volume1HrsUsd))
        XCTAssertEqual(sut.daysUSD, formatCurrency(exchange.volume1DayUsd))
        XCTAssertEqual(sut.monthsUSD, formatCurrency(exchange.volume1MthUsd))
    }

    func createExchange() -> Exchange {
        let loadJSON = LoadJSONMock<Exchange>()
        let exchange: Exchange = loadJSON.start(fileName: .exchangeDetailsData, inBundle: Bundle(for: ExchangeDetailsViewModelTest.self))
        return exchange
    }

    func formatDate(_ date: String?, mask: DateMask) -> String {
        date?.convertToDisplayFormat(mask: mask) ?? " - "
    }

    func formatCurrency(_ value: Decimal?) -> String {
        "\((value ?? 0.0).toCurrency())"
    }
}
