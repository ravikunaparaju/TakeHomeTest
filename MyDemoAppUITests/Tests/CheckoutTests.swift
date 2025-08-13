//
//  CartUITests.swift
//  My Demo App
//
//  Created by Ravi Kunaparaju on 13/08/2025.
//

import XCTest

class CheckoutTests: MyDemoAppTestBase {

    private let bottomNavigationScreen = BottomNavigationScreen(app: XCUIApplication())
    private let cartScreen = CartScreen(app: XCUIApplication())
    private let productDetailsScreen = ProductDetailsScreen(app: XCUIApplication())
    private let productListScreen = ProductListScreen(app: XCUIApplication())
    private let logintScreen = LoginScreen(app: XCUIApplication())
    
    func testEmptyCartGoShoppingNavigation() {
        bottomNavigationScreen.navigateToCart()
        XCTAssertTrue(cartScreen.isCartEmpty())
        cartScreen.navigateToShopping()
        XCTAssertTrue(productListScreen.isProductListScreenLoaded())
    }
    
    func testMultiColorProductAddedDisplayedInCart() {
        addProductToCart(productType: "backpack", color: "black")
        addProductToCart(productType: "backpack", color: "green")
        bottomNavigationScreen.navigateToCart()
        XCTAssertTrue(cartScreen.isSelectedProductColorExists("green"))
        XCTAssertTrue(cartScreen.isTotalSelectedItemsDisplayedInCart(2))
        XCTAssertTrue(cartScreen.isSelectedProductColorExists("black"))
    }
    
    func testAddedProductOfGivenQuantityDisplayedInCart() {
        productListScreen.selectProduct("backpack", "black")
        productDetailsScreen.addProductToCart(100)
        bottomNavigationScreen.navigateToCart()
        XCTAssertTrue(cartScreen.isTotalSelectedItemsDisplayedInCart(100))
        XCTAssertTrue(cartScreen.isCartCountDisplayed(100))
    }
    
    func testRemoveProducsFromCart() {
        addProductToCart(productType: "backpack", color: "black")
        addProductToCart(productType: "t-shirt", color: "black")
        addProductToCart(productType: "Fleece jacket", color: "green")
        bottomNavigationScreen.navigateToCart()
        cartScreen.removeProductsFromCart()
        XCTAssertTrue(cartScreen.isCartEmpty(), "Cart is not empty")
    }
    
    func testRemoveProducsFromCartByMinusButton() {
        addProductToCart(productType: "backpack", color: "black")
        bottomNavigationScreen.navigateToCart()
        cartScreen.reduceProductQuantity()
        XCTAssertTrue(cartScreen.isCartEmpty(), "Cart is not empty")
    }
    
    func testUpdateProductQuantity() {
        addProductToCart(productType: "backpack", color: "black")
        bottomNavigationScreen.navigateToCart()
        cartScreen.increaseProductQuantity(10)
        XCTAssertTrue(cartScreen.isTotalSelectedItemsDisplayedInCart(10))
    }
    
    func testCheckoutCart() {
        addProductToCart(productType: "backpack", color: "black")
        bottomNavigationScreen.navigateToCart()
        cartScreen.navigateToCheckout()
        XCTAssertTrue(logintScreen.isLoginScreenDisplayed(), "Login screen is not displayed")
    }
    
    private func addProductToCart(productType: String, color: String) {
        productListScreen.selectProduct(productType, color)
        productDetailsScreen.addProductToCart()
        productDetailsScreen.navigateToProducts()
    }
}
