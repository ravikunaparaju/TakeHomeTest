//
//  ProductDetailsScreen.swift
//  My Demo App
//
//  Created by Ravi Kunaparaju on 12/08/2025.
//

import XCTest

class ProductDetailsScreen {
   private let app: XCUIApplication
    
    init (app: XCUIApplication) {
        self.app = app
    }
    
    private var addToCartButton: XCUIElement {
        app.buttons["AddToCart"]
    }
    
    private var productPrice: XCUIElement {
        app.staticTexts["Price"]
    }
    
    private var subtractMinusButton: XCUIElement {
        app.buttons["SubtractMinus Icons"]
    }
    
    private var addPlusButton: XCUIElement {
        app.buttons["AddPlus Icons"]
    }
    
    // navigates back to producst screen
    func navigateToProducts() {
        app.buttons.element(boundBy: 0).tap()
    }
    
    func isAddCartButtonEnabled() -> Bool {
        addToCartButton.isEnabled
    }
    
    // Add product to card. Fails if add to cart button is not found
    // Parameter: quantity
    //  select no of items to be added to cart
    func addProductToCart(_ quantity: Int = 1) {
        for _ in 0..<quantity {
            guard addToCartButton.waitForExistence(timeout: 1) else {
                return XCTFail("Add cart button not found")
            }
            addToCartButton.tap()
        }
    }
}
