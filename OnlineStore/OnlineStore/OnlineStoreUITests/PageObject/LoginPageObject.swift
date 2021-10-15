//
//  DetailPage.swift
//  OnlineStoreUITests
//
//  Created by Раисат Рамазанова on 19.09.2021.
//

import XCTest

struct LoginPageObject: Page {
    var app: XCUIApplication

    private enum Identifiers {
        static let returnButton = "Выйти из профиля"
    }

    func tapReturnButton() -> PersonalityPageOblect {
        app.staticTexts[Identifiers.returnButton].tap()
        return PersonalityPageOblect(app: app)
    }
}
