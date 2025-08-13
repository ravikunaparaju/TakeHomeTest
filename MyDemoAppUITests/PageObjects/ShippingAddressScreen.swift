//
//  ShippingAddressScreen.swift
//  My Demo App
//
//  Created by Ravi Kunaparaju on 13/08/2025.
//

import XCTest

class ShippingAddressScreen {
    private let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    private var textFieldElements: XCUIElementQuery {
        app.textFields
    }
    
    private var toPayButtonElement: XCUIElement {
        app.buttons["To Payment"]
    }
    
    func isShippingAdressScreenDisplayed() -> Bool {
        app.staticTexts.matching(NSPredicate(format: "label contains[c] %@", "shipping address")).firstMatch.waitForExistence(timeout: 1)
    }
    
    func enterText( _ text: String, in textField: XCUIElement) {
        textField.tap()
        textField.typeText(text)
    }
    
    func enterShippingAddress(_ name: String,
                              _ address: String,
                              _ city: String,
                              _ zipcode: String,
                              _ country: String) {
        enterText(name, in: textFieldElements.element(boundBy: 0))
        enterText(address, in: textFieldElements.element(boundBy: 1))
        enterText(city, in: textFieldElements.element(boundBy: 3))
        enterText(zipcode, in: textFieldElements.element(boundBy: 4))
        enterText(country, in: textFieldElements.element(boundBy: 6))
        toPayButtonElement.tap()
    }
}
