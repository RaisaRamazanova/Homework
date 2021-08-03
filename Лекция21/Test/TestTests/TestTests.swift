//
//  TestTests.swift
//  TestTests
//
//  Created by Дмитрий Рудановский on 02.08.2021.
//

import XCTest
@testable import UnitTestingExamples


class TestUITests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
    }

    func testExample() {
        let viewController = ViewController()
        XCTAssertNil(viewController.view)
    }
    
    func testExample1() {
        // ...
    }
    
    func testExample2() {
        // ...
    }
}
