//
//  ElementHelper.swift
//  QATest
//
//  Created by Julia Lopes on 12/02/17.
//  Copyright © 2017 Youse. All rights reserved.
//

import Foundation
import XCTest

func screen(on: XCUIApplication) -> XCUIElement {
    let screen = on.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
    return screen
}
//
func emailTextField(on: XCUIApplication) -> XCUIElement {
    let field = on.textFields["email_textfield"]
    return field
}

func pswdTextField(on: XCUIApplication) -> XCUIElement {
    let field = on.secureTextFields["password_textfield"]
    return field
}

func loginButton(on: XCUIApplication) -> XCUIElement {
    let field = on.buttons["login_button"]
    return field
}

func accessButton(on: XCUIApplication) -> XCUIElement {
    let field = on.buttons["Acessar"]
    return field
}

func nextButton(on: XCUIApplication) -> XCUIElement {
    let field = on.buttons["Prosseguir"]
    return field
}

func loginWelcomeMessage(mail: String) -> String {
    let msg = "Seja bem vindo, " + mail + "!"
    return msg
}

func getStaticText(on: XCUIApplication, field: String) -> String {
    let toString: XCUIElement = on.staticTexts[field]
    
    return toString.label
}

extension XCUIElement {
//use this in case keyboard try to change the word that is being type
    func setText(on: XCUIApplication, paste: String) {
        UIPasteboard.general.string = paste
        doubleTap()
        on.menuItems["Paste"].tap()
    }
}
