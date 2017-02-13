//
//  LoginFailedTests.swift
//  QATest
//
//  Created by Julia Lopes on 12/02/17.
//  Copyright © 2017 Youse. All rights reserved.
//

import XCTest

class QAUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
        screen(on: app).swipeLeft()
        screen(on: app).swipeLeft()
        accessButton(on: app).tap()
    }
    override func tearDown() {
        super.tearDown()
    }
    
    func testBlankEmail() {
        let emailField = emailTextField(on: app)
        
        emailField.tap()
        emailField.typeText("")
        nextButton(on: app).tap()
        
        XCTAssertTrue(app.staticTexts[Constants.appTexts.wrongMail].exists)
    }

    
    func testWrongEmail() {
        let emailField = emailTextField(on: app)
        let wrongE:[String] = ["user1yousecombr", "casinha@eu.com", "yóuser1%youse.com.br"]
        
        emailField.tap()
        for wMail in wrongE {
            let del = app.keys["delete"]
            while (emailField.value as! String).characters.count > 0 {
                del.tap()
            }
            emailField.setText(on: app, paste: wMail)
            print("testing wrong email of value ", wMail)
            nextButton(on: app).tap()
            XCTAssertTrue(app.staticTexts[Constants.appTexts.wrongMail].exists)
        }
    }
    
    func testBlankPassword() {
        let emailField = emailTextField(on: app)
        let pswdField = pswdTextField(on: app)
        
        emailField.tap()
        emailField.typeText(Constants.User.email1)
        nextButton(on: app).tap()
        
        pswdField.tap()
            pswdField.typeText("")
            loginButton(on: app).tap()
            XCTAssertTrue(app.staticTexts[Constants.appTexts.wrongPassword].exists)
    }
    
    func testWrongPassword() {
        let emailField = emailTextField(on: app)
        let pswdField = pswdTextField(on: app)
        let wrongP:[String] = ["*", "jisisn", "%&#"]
        
        emailField.tap()
        emailField.typeText(Constants.User.email1)
        nextButton(on: app).tap()
        
        pswdField.tap()
        for wPass in wrongP {
            let del = app.keys["delete"]
        while (pswdField.value as! String).characters.count > 0 {
            del.tap()
        }
            pswdField.setText(on: app, paste: wPass)
            print("testing wrong password of value ", wPass)
        loginButton(on: app).tap()
            XCTAssertTrue(app.staticTexts[Constants.appTexts.wrongPassword].exists)
        }
    }
}
