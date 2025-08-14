//
//  ProductListScreen.swift
//  My Demo App
//
//  Created by Ravi Kunaparaju on 12/08/2025.
//

import XCTest

class ProductListScreen {
    
    private let app: XCUIApplication
   
    init(app: XCUIApplication) {
        self.app = app
    }
    
    private var productListScreenElement: XCUIElement {
        app.otherElements["Catalog-screen"]
    }
    
    private var productImageElement: XCUIElement {
        app.images["Product Image"]
    }
    
    private var productNameElement: XCUIElement {
        app.staticTexts["Product Name"]
    }
    
    private var productPriceElement: XCUIElement {
        app.staticTexts["Product Price"]
    }
    
    // returns element label
    private func getProductName(product: XCUIElement) -> String {
        productNameElement.label
    }
    
    // scrolls to the element
    private func scrollToElement(_ element: XCUIElement) {
        if !element.waitForExistence(timeout: 1) {
            for _ in 0..<20 {
                app.swipeUp(velocity: 200)
                if element.waitForExistence(timeout: 1) {
                    break
                }
            }
        }
    }
    
    func isProductListScreenLoaded() -> Bool {
        productListScreenElement.waitForExistence(timeout: 1)
    }
    
    // select element by label
    func selectProduct(_ productType: String, _ productColor: String) {
        let element = app.staticTexts.matching(NSPredicate(format: "label contains[c] %@ AND label contains[c] %@", productType, productColor)).firstMatch
        scrollToElement(element)
        element.tap()
    }
    
}
