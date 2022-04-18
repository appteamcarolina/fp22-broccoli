//
//  Broccoli_ProjectTests.swift
//  Broccoli-ProjectTests
//
//  Created by AlecNipp on 4/7/22.
//

import XCTest
@testable import Broccoli_Project

class Broccoli_ProjectTests: XCTestCase {
    var exampleMusicQuery: [TDQuery]!
    var exampleMovieQuery: [TDQuery]!
    
    override func setUpWithError() throws {
        exampleMusicQuery = [TDQuery(name: "red hot chili peppers", type: MediaType.music)]
        exampleMovieQuery = [TDQuery(name: "Rush", type: MediaType.movie)]

    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMusicFetch() async {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        do {
            let result = try await TasteDiveService.fetchRecommendations(queryItems: exampleMusicQuery)
            print(result)
            XCTAssertEqual(result.last!.name, "The Beatles")
        }
        catch {
            print(error)
        }
        
    }
    

}
