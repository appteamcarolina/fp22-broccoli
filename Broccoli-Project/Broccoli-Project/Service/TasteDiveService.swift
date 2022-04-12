//
//  TasteDiveService.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 3/31/22.
//

import Foundation

public final class TasteDiveService {
    
    static private let decoder = JSONDecoder()
    
    static private func generateQueryString(queryItems: [TDQuery]) -> String {
        var queryStrings = [String]()
        for item in queryItems {
            queryStrings.append("\(item.type.rawValue):\(item.name)")
        }
        print(queryStrings.joined(separator: ", "))
        return queryStrings.joined(separator: ", ")
    }
    
    static private func convertToURLQueryItems(queryItems: [TDQuery]) -> [URLQueryItem] {
        return [URLQueryItem(name: "q", value: generateQueryString(queryItems: queryItems)),
                URLQueryItem(name: "k", value: "435192-Broccoli-4PAMC86G"),
                URLQueryItem(name:"info", value: "1")
        ]
    }
    
    static func fetchRecommendations(queryItems: [TDQuery]) async throws -> [TDItem] {
        var urlcomps = URLComponents(string: "https://tastedive.com/api/similar")!
        urlcomps.queryItems = convertToURLQueryItems(queryItems: queryItems)
        
        var request = URLRequest(url: urlcomps.url!)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let response = response as? HTTPURLResponse {
            print(response.statusCode)
        }
        
        let decodedResponse = try decoder.decode(TDResponse.self, from: data)
        return decodedResponse.data.results
    }
}

extension TasteDiveService {
    static func getExampleData() -> [TDItem] {
        var dummy: [TDItem] = []
        for _ in 0...10 {
            dummy.append(TDItem.example)
        }
        return dummy
    }
}


struct TDQuery: Identifiable, Equatable {
    let name: String
    let type: MediaType
    let id = UUID()
}

extension TDQuery {
    public static var example: TDQuery {
        return TDQuery(name: "Pink Floyd", type: MediaType.music)
    }
}

struct TDResponse: Decodable {
    let data: TDSimilarData
    
    enum CodingKeys: String, CodingKey {
        case data = "Similar"
    }
}

struct TDSimilarData: Decodable {
    
    let results: [TDItem]
    enum CodingKeys: String, CodingKey {
        case results = "Results"
    }
    
}


struct TDItem: Codable {
    let name: String
    let type: String
    let wTeaser: String
    let wUrl: String
    let yUrl: String
    let yID: String
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case type = "Type"
        case wTeaser
        case wUrl
        case yUrl
        case yID
    }
}

extension TDItem {
    public static var example: TDItem {
        TDItem(name: "Thor: Ragnarok", type: "movie", wTeaser: "Thor: Ragnarok is a 2017 American superhero film based on the Marvel Comics character Thor, produced by Marvel Studios and distributed by Walt Disney Studios Motion Pictures. It is the sequel to Thor (2011) and Thor: The Dark World (2013), and the 17th film in the Marvel Cinematic Universe (MCU). The film was directed by Taika Waititi from a screenplay by Eric Pearson and the writing team of Craig Kyle and Christopher Yost, and stars Chris Hemsworth as Thor alongside Tom Hiddleston, Cate Blanchett, Idris Elba, Jeff Goldblum, Tessa Thompson, Karl Urban, Mark Ruffalo, and Anthony Hopkins. In Thor: Ragnarok, Thor must escape the alien planet Sakaar in time to save Asgard from Hela (Blanchett) and the impending Ragnar.", wUrl: "https://en.wikipedia.org/wiki/Thor:_Ragnarok", yUrl: "https://www.youtube-nocookie.com/embed/ue80QwXMRHg", yID: "ue80QwXMRHg")
    }
}

