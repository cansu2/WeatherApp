//
//  BaseTest.swift
//  WeatherAppUITests
//
//  Created by Cansu Alaeddinoglu on 1/9/23.
//

import XCTest

class Logger {
    func log(_ mlog: String) {
        NSLog(mlog)
    }
}

public class BaseTest {
    typealias Completion = (()-> Void)?
    let app = XCUIApplication()
    let log = Logger().log
    required init(timeout: TimeInterval = 10, completion: Completion = nil){
        log("waiting \(timeout)s for \(String(describing: self)) existence")
        XCTAssert(rootElement.waitForExistence(timeout: timeout),
        "Page \(String(describing: self)) waited, but not loaded)")
        completion?()
    }
    
    var rootElement: XCUIElement {
        fatalError("subclass should override rootElement")
    }
    
    func button(_ name: String) -> XCUIElement {
        return app.buttons[name]
    }
    
    func navBar(_ name: String) -> XCUIElement {
        return app.navigationBars[name]
    }
    
    func secureField(_ name: String) -> XCUIElement {
        return app.secureTextFields[name]
    }
    
    func textField(_ name: String) -> XCUIElement {
        return app.textFields[name]
    }
    
    func textView(_ name: String) -> XCUIElement {
        return app.textViews[name]
    }
    
    func text(_ name: String) -> XCUIElement {
        return app.staticTexts[name]
    }
}
