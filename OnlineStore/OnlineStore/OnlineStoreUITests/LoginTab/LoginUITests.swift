//
//  Login.swift
//  OnlineStoreUITests
//
//  Created by Раисат Рамазанова on 19.09.2021.
//

import XCTest

class LoginTabUITests: XCTestCase {

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

    func testExample() throws {
        _ = PersonalityPageOblect(app: app).loginUser()
        _ = PersonalityPageOblect(app: app).tapCancelButton()
    }
}
