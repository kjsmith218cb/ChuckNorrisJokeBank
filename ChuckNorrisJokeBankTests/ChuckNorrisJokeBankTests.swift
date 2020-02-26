//
//  ChuckNorrisJokeBankTests.swift
//  ChuckNorrisJokeBankTests
//
//  Created by Code Nation on 26/02/2020.
//  Copyright © 2020 Daniel Sutcliffe. All rights reserved.
//

import XCTest

// Make my application code available for testing
@testable import ChuckNorrisJokeBank

class ChuckNorrisJokeBankTests: XCTestCase {
    
    var helloWorld: String?
    var buttonCount: Int = 0
    
    func buttonCountFunction() {
        // mimicking buttonCountFunction logic inside of ViewController.swift
        buttonCount += 1
    }
    

    override func setUp() {
        helloWorld = "hello world"
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
//
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    // Learn about Unit Testing...
    func testHelloWorld() {
//        var helloWorld: String?
//        XCTAssertNil(helloWorld)
//
//        helloWorld = "hello world"
        // un/comment to show pass vs fail test
        XCTAssertEqual(helloWorld, "hello world")
//        XCTAssertEqual(helloWorld, "hello worldx")
    }
    
    func testButtonCountIncrease() {
        buttonCount = 0
        buttonCountFunction()
        XCTAssertTrue(buttonCount == 1)
    }
    

}
