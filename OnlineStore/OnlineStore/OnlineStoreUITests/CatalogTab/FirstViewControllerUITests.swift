//
//  OnlineStoreUITests.swift
//  OnlineStoreUITests
//
//  Created by Рамазанова Раисат on 02.08.2021.
//

import XCTest

class CatalogTabUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testSearchFieldElementExists() {
        // arrange
        let search = app.searchFields["Поиск"]
        // act
        let boolValue = search.exists
        // assert
        XCTAssert(boolValue)
    }
}
