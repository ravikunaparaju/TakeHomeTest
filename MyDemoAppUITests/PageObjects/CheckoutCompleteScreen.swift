//
//  CheckoutCompleteScreen.swift
//  My Demo App
//
//  Created by Ravi Kunaparaju on 13/08/2025.
//

import XCTest

class CheckoutCompleteScreen {
    private let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    private var checkoutCompleteTextElement: XCUIElement {
        app.staticTexts["Checkout Complete"]
    }
    
    private var cartItemsCountImage: XCUIElement {
        app.images["GreenRoundView Icons"]
    }
    
    func isCheckoutComplete() -> Bool {
        checkoutCompleteTextElement.exists
    }
    
    // Verifies bottom cart icon shows empty
    func isCartEmpty() -> Bool{
        !cartItemsCountImage.exists
    }
}
