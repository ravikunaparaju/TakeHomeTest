//
//  LoginScreen.swift
//  My Demo App
//
//  Created by Ravi Kunaparaju on 13/08/2025.
//

import XCTest

class LoginScreen {
    private let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    private var bobEmailButtonElement: XCUIElement {
        app.buttons["bob@example.com"]
    }
    
    private var loginButtonElement: XCUIElement {
        app.buttons["Login"]
    }
    
    func loginWithBobEmail() {
        bobEmailButtonElement.tap()
        loginButtonElement.tap()
    }
    
    func isLoginScreenDisplayed() -> Bool {
        loginButtonElement.waitForExistence(timeout: 1)
    }
}
