//
//  OnlineStoreUITests.swift
//  OnlineStoreUITests
//
//  Created by Рамазанова Раисат on 02.08.2021.
//

import XCTest

class OnlineStoreUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testExample() throws {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//    }

    func testTupElementSuccess() {

        let userSearchText = "abc"

        let searchField = XCUIApplication().searchFields["Поиск..."]
        let textInSearch = searchField
        textInSearch.tap()

        textInSearch.typeText(userSearchText)

        searchField.buttons["Clear text"].tap()

    }
}
