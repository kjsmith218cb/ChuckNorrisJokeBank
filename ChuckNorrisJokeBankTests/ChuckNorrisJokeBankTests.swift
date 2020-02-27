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
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        helloWorld = "hello world"
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
// *****************************MY TESTS******************************************
    
    // Learn about Unit Testing [1]...
    func testHellowWorldIsString() {
        var helloWorld: String?
        XCTAssertNil(helloWorld)
    }
    // Learn about Unit Testing [2]...
    func testHelloWorldContent() {
        // un-comment to show pass vs fail test
        XCTAssertEqual(helloWorld, "hello world")
//        XCTAssertEqual(helloWorld, "hello worldx")
    }
    
    // Try testing a function within one of my ViewControllers
    
    // Is UILabel test correct?
    func labelTest() {
        
    }
    
    // Is button ??? enabled?
    func buttonTest() {
        
    }
        
// *****************************MY TESTS******************************************

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
