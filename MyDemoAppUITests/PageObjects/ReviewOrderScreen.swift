//
//  ReviewOrderScreen.swift
//  My Demo App
//
//  Created by Ravi Kunaparaju on 13/08/2025.
//

import XCTest

class ReviewOrderScreen {
    private let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    private var placeOrderButton: XCUIElement {
        app.buttons["Place Order"]
    }
    
    func isProductDisplayed(_ productName: String, _ productColor: String) -> Bool {
        app.staticTexts.matching(NSPredicate(format: "label contains[c] %@ AND label contains[c] %@", productName, productColor)).firstMatch.waitForExistence(timeout: 1)
    }
    
    func isTotalSelectedItemsDisplayed(_ total: Int) -> Bool {
        app.staticTexts.matching(NSPredicate(format: "label contains[c] %@", "\(total) Items")).firstMatch.exists
    }
    
    func placeOrder() {
        _=placeOrderButton.waitForExistence(timeout: 1)
        placeOrderButton.tap()
    }
    
}
