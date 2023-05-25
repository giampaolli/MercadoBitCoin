//
//  MercadoBitcoinUITests.swift
//  MercadoBitcoinUITests
//
//  Created by Felipe Giampaoli on 21/05/23.
//

import XCTest

final class MercadoBitcoinUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testExchangeViewControllerInit() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let exchangesListViewControllerTitle = app.staticTexts["Excahnges"]
        let myTable = app.tables.matching(identifier: "exchangeTableView")

        XCTAssertNotNil(exchangesListViewControllerTitle)
        XCTAssertNotNil(myTable)

    }

    func testExchangeViewControllerHasCell() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let myTable = app.tables.matching(identifier: "exchangeTableView")
        let cell = myTable.cells.element(matching: .cell, identifier: "exchangeCell_0")

        XCTAssertNotNil(cell)
    }

    func testExchangeViewController_goToDetails() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let myTable = app.tables.matching(identifier: "exchangeTableView")
        let cell = myTable.cells.element(matching: .cell, identifier: "exchangeCell_0")
        cell.tap()

        let websiteLabel = app.staticTexts["Website"]
        XCTAssertNotNil(websiteLabel)
    }
}
