//
//  SwipeViewsTest.swift
//  QATest
//
//  Created by Julia Lopes on 12/02/17.
//  Copyright © 2017 Youse. All rights reserved.
//

import XCTest

class SwipeViewsTest: XCTestCase {
    let app =  XCUIApplication()
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFirstScreenShouldShowHelloMessage() {
        XCTAssertTrue(app.staticTexts[Constants.appTexts.helloMessage].exists)
    }
    func testSecondScreenShouldShowWelcomeMessage() {
        screen(on: app).swipeLeft()
        XCTAssertTrue(app.staticTexts[Constants.appTexts.welcomeMessage].exists)
    }
    func testThirdScreenShouldShowAccesButton() {
        screen(on: app).swipeLeft()
        screen(on: app).swipeLeft()
        XCTAssertTrue(accessButton(on: app).exists)
    }
}
