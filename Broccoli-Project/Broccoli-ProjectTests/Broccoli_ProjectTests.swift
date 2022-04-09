//
//  Broccoli_ProjectTests.swift
//  Broccoli-ProjectTests
//
//  Created by AlecNipp on 4/7/22.
//

import XCTest
@testable import Broccoli_Project

class Broccoli_ProjectTests: XCTestCase {
    var exampleQuery: [TDItem]!
    
    override func setUpWithError() throws {
        exampleQuery = [TDItem(name: "red hot chili peppers", type: "band")]
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() async {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        do {
            let result = try await TasteDiveService.fetchRecommendations(queryItems: exampleQuery)
            print(result)
            XCTAssertEqual(result.last!.name, "The Beatles")
        }
        catch {
            print(error)
        }
        
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
