//
//  ExchangeListViewControllerUITests.swift
//  MercadoBitcoin
//
//

import XCTest

class ExchangeListViewControllerUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments += ["-UITests"]
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testExchangeListAppearsAndShowsCells() throws {
        let tableView = app.tables["exchangeListTableView"]
        XCTAssertTrue(
            tableView.waitForExistence(timeout: 5),
            "The exchange list table should appear within 5 seconds"
        )

        let firstCell = tableView.cells.element(boundBy: 0)
        XCTAssertTrue(
            firstCell.waitForExistence(timeout: 5),
            "There should be at least one cell in the exchange list after waiting up to 5 seconds"
        )

        let nameLabel = firstCell.staticTexts["exchangeNameLabel"]
        XCTAssertTrue(
            nameLabel.exists,
            "The exchange name label should exist in the cell"
        )

        let volumeLabel = firstCell.staticTexts["exchangeVolumeLabel"]
        XCTAssertTrue(
            volumeLabel.exists,
            "The exchange volume label should exist in the cell"
        )
    }
    
    func testTapNameLabelNavigatesToDetail() throws {
        let nameLabels = app.staticTexts.matching(identifier: "exchangeNameLabel")
        XCTAssertTrue(
            nameLabels.firstMatch.waitForExistence(timeout: 5),
            "Exchange name label should appear within 5 seconds"
        )

        let firstNameLabel = nameLabels.element(boundBy: 0)
        let exchangeName = firstNameLabel.label
        firstNameLabel.tap()

        let detailNavBar = app.navigationBars[exchangeName]
        XCTAssertTrue(
            detailNavBar.waitForExistence(timeout: 5),
            "The detail screen for \(exchangeName) should be displayed"
        )
    }
}

