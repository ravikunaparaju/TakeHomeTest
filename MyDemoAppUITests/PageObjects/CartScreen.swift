//
//  CartScreen.swift
//  My Demo App
//
//  Created by Ravi Kunaparaju on 12/08/2025.
//

import XCTest

class CartScreen {
    private let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    private var proceedToCheckoutButton: XCUIElement {
        app.buttons["ProceedToCheckout"]
    }
    
    private var removeItemButtons: XCUIElementQuery {
        app.buttons.matching(NSPredicate(format: "label contains[c] %@", "remove"))
    }
    
    private var goShoppingButton: XCUIElement {
        app.buttons["GoShopping"]
    }
    
    private var noItemsTextElement: XCUIElement {
        app.staticTexts["No Items"]
    }
    
    private var emptyCartImageElement: XCUIElement {
        app.images["CartEmpty Icons"]
    }
    
    private var subtractMinusButton: XCUIElement {
        app.buttons["SubtractMinus Icons"]
    }
    
    private var addPlusButton: XCUIElement {
        app.buttons["AddPlus Icons"]
    }
    
    func navigateToCheckout() {
        _=proceedToCheckoutButton.waitForExistence(timeout: 1)
        proceedToCheckoutButton.tap()
    }
    
    func navigateToShopping() {
        guard goShoppingButton.waitForExistence(timeout: 1) else {
            return XCTFail("\(goShoppingButton) does not exist on screen")
        }
        goShoppingButton.tap()
    }
    
    func isCartEmpty() -> Bool {
        noItemsTextElement.exists && emptyCartImageElement.exists
    }
    
    func isSelectedProductColorExists(_ color: String) -> Bool {
        app.staticTexts.matching(NSPredicate(format: "label ==[c] %@", color)).firstMatch.exists
    }
    
    func isTotalSelectedItemsDisplayedInCart(_ total: Int) -> Bool {
        app.staticTexts.matching(NSPredicate(format: "label contains[c] %@", "\(total) Items")).firstMatch.exists
    }
    
    func removeProductFromCart() {
        _=removeItemButtons.firstMatch.waitForExistence(timeout: 1)
        removeItemButtons.firstMatch.tap()
    }
    
    func removeProductsFromCart() {
        let count = removeItemButtons.count
        for _ in 0..<count {
            removeProductFromCart()
        }
    }
    
    func reduceProductQuantity() {
        _=subtractMinusButton.waitForExistence(timeout: 1)
        subtractMinusButton.tap()
    }
    
    func increaseProductQuantity(_ quantity: Int) {
        _=addPlusButton.waitForExistence(timeout: 1)
        for _ in 1..<quantity {
            addPlusButton.tap()
        }
    }
    
    func isCartCountDisplayed(_ count: Int) -> Bool{
        let cartCountText = app.staticTexts.matching(NSPredicate(format: "label ==[c] %@", "\(count)")).element(boundBy: 1)
        return cartCountText.waitForExistence(timeout: 1)
    }
    
}
