//
//  PaymentMethodScreen.swift
//  My Demo App
//
//  Created by Ravi Kunaparaju on 13/08/2025.
//

import XCTest

class PaymentMethodScreen {
    
    private let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    private var textFieldElements: XCUIElementQuery {
        app.textFields
    }
    
    private var reviewOrderButtonElement: XCUIElement {
        app.buttons["Review Order"]
    }
    
    func isPaymentMethodScreenDisplayed() -> Bool {
        app.staticTexts.matching(NSPredicate(format: "label contains[c] %@", "payment method")).firstMatch.waitForExistence(timeout: 1)
    }
    
    func enterText( _ text: String, in textField: XCUIElement) {
        textField.tap()
        textField.typeText(text)
    }
    
    func enterPaymentMethod(_ name: String,
                              _ number: String,
                              _ expiry: String,
                              _ security: String) {
        enterText(name, in: textFieldElements.element(boundBy: 0))
        enterText(number, in: textFieldElements.element(boundBy: 1))
        enterText(expiry, in: textFieldElements.element(boundBy: 2))
        enterText(security, in: textFieldElements.element(boundBy: 3))
        reviewOrderButtonElement.tap()
    }
}
