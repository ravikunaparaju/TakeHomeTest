//
//  BottomNavigationScreen.swift
//  My Demo App
//
//  Created by Ravi Kunaparaju on 12/08/2025.
//

import XCTest

class BottomNavigationScreen {
    private let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    private var catalogButton: XCUIElement {
        app.buttons["Catalog-tab-item"]
    }
    
    private var cartButton: XCUIElement {
        app.buttons["Cart-tab-item"]
    }
    
    private var moreButton: XCUIElement {
        app.buttons["More-tab-item"]
    }
    
    // navigates to cart screen
    func navigateToCart() {
        cartButton.tap()
    }
    
    // navigates to catelog screen
    func navigateToCatelog() {
        cartButton.tap()
    }
}
