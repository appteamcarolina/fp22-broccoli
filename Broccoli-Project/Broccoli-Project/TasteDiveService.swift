//
//  TasteDiveService.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 3/31/22.
//

import Foundation

public final class TasteDiveService {
    
    static private let decoder = JSONDecoder()
    
    static private func generateQueryString(queryItems: [TDItem]) -> String {
        var queryStrings = [String]()
        for item in queryItems {
            queryStrings.append("\(item.type):\(item.name)")
        }
        return queryStrings.joined(separator: ", ")
    }
    
    static private func convertToURLQueryItems(queryItems: [TDItem]) -> [URLQueryItem] {
        return [URLQueryItem(name: "q", value: generateQueryString(queryItems: queryItems)),
                URLQueryItem(name: "k", value: "435192-Broccoli-4PAMC86G"),
                URLQueryItem(name:"info", value: "1")
        ]
    }
    
    static func fetchRecommendations(queryItems: [TDItem]) async throws -> [TDItem] {
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
        for i in 0...10 {
            dummy.append(TDItem(name: "Artist \(i)", type: "music"))
        }
        return dummy
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
    
    init(name: String, type: String) {
        self.name = name
        self.type = type
        self.wTeaser = ""
        self.wUrl = ""
        self.yUrl = ""
        self.yID = ""
        
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case type = "Type"
        case wTeaser
        case wUrl
        case yUrl
        case yID
    }
}



