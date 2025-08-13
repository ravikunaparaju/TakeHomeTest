//
//  CartUITests.swift
//  My Demo App
//
//  Created by Ravi Kunaparaju on 13/08/2025.
//

import XCTest
s
class CheckoutTests: MyDemoAppTestBase {
    
    // Verify empty shopping cart
    func testEmptyCartGoShoppingNavigation() {
        bottomNavigationScreen.navigateToCart()
        XCTAssertTrue(cartScreen.isCartEmpty())
        cartScreen.navigateToShopping()
        XCTAssertTrue(productListScreen.isProductListScreenLoaded())
    }
    
    // verify total items count correctly displayed in cart screen
    func testAddedProductOfGivenQuantityDisplayedInCart() {
        productListScreen.selectProduct("backpack", "black")
        productDetailsScreen.addProductToCart(100)
        bottomNavigationScreen.navigateToCart()
        XCTAssertTrue(cartScreen.isQuantityAndPriceUpdated(100))
        XCTAssertTrue(cartScreen.isCartCountDisplayed(100))
    }
    
    // Verify remove product from cart by remove button
    func testRemoveProducsFromCart() {
        addProductToCart(productType: "backpack", color: "black")
        addProductToCart(productType: "t-shirt", color: "black")
        addProductToCart(productType: "Fleece jacket", color: "green")
        bottomNavigationScreen.navigateToCart()
        cartScreen.removeProductsFromCart()
        XCTAssertTrue(cartScreen.isCartEmpty(), "Cart is not empty")
    }
    
    // Verify remove product from cart by minus button
    func testRemoveProducsFromCartByMinusButton() {
        addProductToCart(productType: "backpack", color: "black")
        bottomNavigationScreen.navigateToCart()
        cartScreen.reduceProductQuantity()
        XCTAssertTrue(cartScreen.isCartEmpty(), "Cart is not empty")
    }
    
    // Verify product count and price updated in cart
    func testUpdateProductQuantityUpdatesTotalPrice() {
        addProductToCart(productType: "backpack", color: "black")
        bottomNavigationScreen.navigateToCart()
        cartScreen.increaseProductQuantity(10)
        XCTAssertTrue(cartScreen.isQuantityAndPriceUpdated(10), "items count & price not updated")
    }
    
    // MARK: Failing tests because of functional defects
    
    // Verify multi color product added to cart
    func testMultiColorProductAddedDisplayedInCart() {
        addProductToCart(productType: "backpack", color: "black")
        addProductToCart(productType: "backpack", color: "green")
        bottomNavigationScreen.navigateToCart()
        XCTAssertTrue(cartScreen.isSelectedProductColorExists("green"), "green color backpack is not displayed")
        XCTAssertTrue(cartScreen.isQuantityAndPriceUpdated(2))
        XCTAssertTrue(cartScreen.isSelectedProductColorExists("black"), "black color backpack is not displayed")
    }
    
    // Verify complete checkout clears cart items
    func testCompleteCheckout() {
        addProductToCart(productType: "backpack", color: "black")
        bottomNavigationScreen.navigateToCart()
        cartScreen.navigateToCheckout()
        XCTAssertTrue(logintScreen.isLoginScreenDisplayed(), "Login screen is not displayed")
        logintScreen.loginWithBobEmail()
        shippingAddressScreen.enterShippingAddress("ravi kunaparaju", "12345", "London", "12345", "united kingdom")
        paymentmethodScreen.enterPaymentMethod("ravi", "2133444421231234", "1232", "123")
        reviewOrderScreen.placeOrder()
        XCTAssertTrue(checkoutCompleteScreen.isCheckoutComplete(), "checout complete text is not displayed")
        XCTAssertTrue(checkoutCompleteScreen.isCartEmpty(), "Cart is not empty")
    }
    
    
    // MARK: Private
    
    private func addProductToCart(productType: String, color: String) {
        productListScreen.selectProduct(productType, color)
        productDetailsScreen.addProductToCart()
        productDetailsScreen.navigateToProducts()
    }
    
    private let bottomNavigationScreen = BottomNavigationScreen(app: XCUIApplication())
    private let cartScreen = CartScreen(app: XCUIApplication())
    private let productDetailsScreen = ProductDetailsScreen(app: XCUIApplication())
    private let productListScreen = ProductListScreen(app: XCUIApplication())
    private let logintScreen = LoginScreen(app: XCUIApplication())
    private let shippingAddressScreen = ShippingAddressScreen(app: XCUIApplication())
    private let paymentmethodScreen = PaymentMethodScreen(app: XCUIApplication())
    private let reviewOrderScreen = ReviewOrderScreen(app: XCUIApplication())
    private let checkoutCompleteScreen = CheckoutCompleteScreen(app: XCUIApplication())
}
