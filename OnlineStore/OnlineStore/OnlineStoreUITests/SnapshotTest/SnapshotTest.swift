//
//  SnapshotTest.swift
//  OnlineStoreUITests
//
//  Created by Раисат Рамазанова on 20.09.2021.
//

import XCTest
import SnapshotTesting

@testable import OnlineStore

final class ScreenTests: XCTestCase {
    var sut: FirstViewController!

    override func setUp() {
        sut = FirstViewController()
    }

    func test_screenSnapshot() {
        assertSnapshot(matching: sut, as: .image(on: .iPhone8))
    }
}
