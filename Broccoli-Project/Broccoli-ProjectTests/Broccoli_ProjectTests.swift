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
            let first = result.first ?? nil
            XCTAssertEqual(first, ComparisonData.nirvanaTDItem)
        }
        catch {
            print(error)
        }
        
    }
    
    func testMovieFetch() async {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        do {
            let result = try await TasteDiveService.fetchRecommendations(queryItems: exampleMovieQuery)
            print(result)
            let first = result.first ?? nil
            XCTAssertEqual(first, ComparisonData.twelveYearsTDItem)
        }
        catch {
            print(error)
        }
        
    }
    

}


final class ComparisonData {
    public static let nirvanaTDItem = TDItem(name: "Nirvana", type: "music", wTeaser: "Nirvana was an American rock band formed in Aberdeen, Washington in 1987. Founded by lead singer and guitarist Kurt Cobain and bassist Krist Novoselic, the band went through a succession of drummers, most notably Chad Channing, before recruiting Dave Grohl in 1990. Nirvana\'s success popularized alternative rock, and they were often referenced as the figurehead band of Generation X. Their music maintains a popular following and continues to influence modern rock and roll culture.In the late 1980s, Nirvana established itself as part of the Seattle grunge scene, releasing its first album, Bleach, for the independent record label Sub Pop in 1989. They developed a sound that relied on dynamic contrasts, often between quiet verses and loud, heavy choruses. After signing to major label DGC Records in 1991, Nirvana found unexpected mainstream success with \"Smells Like Teen Spirit\", the first single from their landmark second album Nevermind (1991). A cultural phenomenon of the 1990s, Nevermind was certified Diamond by the RIAA and is credited for ending the dominance of hair metal.", wUrl: "http://en.wikipedia.org/wiki/Ted_Ed_Fred", yUrl: "https://www.youtube-nocookie.com/embed/hTWKbfoikeg", yID: "hTWKbfoikeg")
    public static let twelveYearsTDItem = TDItem(name: "12 Years A Slave", type: "movie", wTeaser: "12 Years a Slave is a 2013 biographical period-drama film directed by Steve McQueen from a screenplay by John Ridley, based on  the 1853 slave memoir Twelve Years a Slave by Solomon Northup, a New York State-born free African-American man who was kidnapped in Washington, D.C. by two conmen in 1841 and sold into slavery. Northup was put to work on plantations in the state of Louisiana for 12 years before being released. The first scholarly edition of Northup\'s memoir, co-edited in 1968 by Sue Eakin and Joseph Logsdon, carefully retraced and validated the account and concluded it to be accurate.Chiwetel Ejiofor stars as Solomon Northup. Michael Fassbender, Benedict Cumberbatch, Paul Dano, Garret Dillahunt, Paul Giamatti, Scoot McNairy, Lupita Nyong\'o, Adepero Oduye, Sarah Paulson, Brad Pitt, Michael Kenneth Williams, and Alfre Woodard feature in supporting roles. Principal photography took place in New Orleans, Louisiana, from June 27 to August 13, 2012. The locations used were four historic antebellum plantations: Felicity, Bocage, Destrehan, and Magnolia. Of the four, Magnolia is nearest to the actual plantation where Northup was held.", wUrl: "http://en.wikipedia.org/wiki/12_Years_a_Slave_(film)", yUrl: "https://www.youtube-nocookie.com/embed/z02Ie8wKKRg", yID: "z02Ie8wKKRg")
}
