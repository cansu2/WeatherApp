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
        log("waiting \(timeout)s for \String(describing)")
        XCTAssert(root.waitForExistence(timeout: timeout),
        "Page \(String(describing: self)) waited, but not loaded)")
        completion?()
    }
}
