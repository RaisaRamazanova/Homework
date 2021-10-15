//
//  OnlineStoreTests.swift
//  OnlineStoreTests
//
//  Created by Рамазанова Раисат on 02.08.2021.
//

import XCTest
@testable import OnlineStore

class OnlineStoreTests: XCTestCase {

    var controller: FirstViewController!
    override func setUp() {
        super.setUp()
        controller = FirstViewController()
    }

    override func tearDown() {
        controller = nil
        super.tearDown()
    }

    func test_view_not_nil() throws {
        XCTAssertNotNil(controller.view)
    }

    func test_viewModel_not_nil() throws {
        XCTAssertNotNil(controller.viewModel)
    }
}
