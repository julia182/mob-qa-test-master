//
//  QATestUITests.swift
//  QATestUITests
//
//  Created by Julia Lopes on 12/02/17.
//  Copyright © 2017 Youse. All rights reserved.
//

import XCTest

class LoginSuccesTests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
        screen(on: app).swipeLeft()
        screen(on: app).swipeLeft()
    }
    override func tearDown() {
        super.tearDown()
    }
    
    func testLoginSucesfull() {
        let emailField = emailTextField(on: app)
        let pswdField = pswdTextField(on: app)

        accessButton(on: app).tap()

        emailField.tap()
        emailField.typeText(Constants.User.email1)
        nextButton(on: app).tap()

        pswdField.tap()
        pswdField.typeText(Constants.User.pswd)
        loginButton(on: app).tap()

        let welcomeMsg = getStaticText(on: app, field: "greeting_label")
        XCTAssertEqual(loginWelcomeMessage(mail: Constants.User.email1), welcomeMsg)
    }
}
