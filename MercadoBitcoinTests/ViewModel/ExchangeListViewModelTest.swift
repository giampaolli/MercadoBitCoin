//
//  ExchangeListViewModelTest.swift
//  MercadoBitcoinTests
//
//  Created by Felipe Giampaoli on 21/05/23.
//

import XCTest
@testable import MercadoBitcoin

final class ExchangeListViewModelTest: XCTestCase {

    var sut: ExchangeListViewModel!

    override func tearDownWithError() throws {
        sut = nil
    }

    func testViewModelInit() {
        // GIVEN
        let sut = configureSUT()

        // THEN
        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.exchangeList)
        XCTAssertNotNil(sut.filterExchangeList)
        XCTAssertNotNil(sut.isFilterMode)
    }

    func testLoadExchangeSuccess() {
        // GIVEN
        let response = createExchangeResponse()
        sut = configureSUT(.success(response))

        // WHEN
        sut.loadExchanges()

        // THEN
        XCTAssertEqual(sut.exchangeList, response)
        XCTAssertEqual(sut.exchangeList.count, 2)
        XCTAssertEqual(sut.filterExchangeList.count, 0)
        XCTAssertFalse(sut.isFilterMode)
    }

    func testLoadExchangeFailure() {
        // GIVEN
        sut = configureSUT(.failure(.generic))

        // WHEN
        sut.loadExchanges()

        // THEN
        XCTAssertEqual(sut.exchangeList.count, 0)
        XCTAssertEqual(sut.filterExchangeList.count, 0)
        XCTAssertFalse(sut.isFilterMode)
    }

    func testLoadExchangeIsFilterMode() {
        // GIVEN
        let response = createExchangeResponse()
        sut = configureSUT(.success(response))

        // WHEN
        sut.loadExchanges()
        sut.filterExchange("Binance")

        // THEN
        XCTAssertTrue(sut.isFilterMode)
    }

    func testLoadExchangeFilterCorrect() {
        // GIVEN
        let query = "Binance"
        let response = createExchangeResponse()
        let filterResponse = response.filter({ exchange in
            if let name = exchange.name {
                return name.hasPrefix(query)
            }
            return false
        })

        sut = configureSUT(.success(response))

        // WHEN
        sut.loadExchanges()
        sut.filterExchange(query)

        // THEN
        XCTAssertEqual(sut.exchangeList, response)
        XCTAssertEqual(sut.exchangeList.count, 2)

        XCTAssertEqual(sut.filterExchangeList, filterResponse)
        XCTAssertEqual(sut.filterExchangeList.count, 1)
    }

    func testLoadExchangeGoToDetails() {
        // GIVEN
        let response = createExchangeResponse()
        let spy = ExchangeListCoordinatorSpy()
        let exchange = response[0]
        sut = configureSUT(.success(response))
        sut.coordinatorDelegate = spy

        // WHEN
        sut.loadExchanges()
        sut.showDetails(exchange: exchange)

        // THEN

        XCTAssertEqual(spy.exchange, exchange)
    }

    // MARK: - HELPERS

    private func createExchangeResponse() -> [Exchange] {
        let loadJSON = LoadJSONMock<[Exchange]>()
        let excahnges: [Exchange] = loadJSON.start(fileName: .exchangeListSucess, inBundle: Bundle(for: ExchangeListViewModelTest.self))
        return excahnges
    }

    private func configureSUT(_ responseType: ExchangeListServiceMock.ResponseType = .success([])) -> ExchangeListViewModel {
        let serviceMock = ExchangeListServiceMock(responseType: responseType)
        let sut = ExchangeListViewModel(service: serviceMock)

        return sut
    }

    // MARK: - ExchangeListServiceMock
    
    private class ExchangeListServiceMock: ExchangeListServiceProtocol {

        enum ResponseType {
            case success([Exchange])
            case failure(NetworkError)
        }

        var responseType: ResponseType

        init(responseType: ResponseType) {
            self.responseType = responseType
        }

        func fetchExchanges(complition: @escaping MercadoBitcoin.LoadExchangeCompletion) {
            switch responseType {
            case .success(let exchanges):
                complition(.success(exchanges))
            case .failure(let error):
                complition(.failure(error))
            }
        }
    }

    private class ExchangeListCoordinatorSpy: ExchangeCoordinatorDelegateProtocol {

        init() { }

        var exchange: MercadoBitcoin.Exchange!

        func showDetails(exchange: MercadoBitcoin.Exchange) {
            self.exchange = exchange
        }

    }

}
