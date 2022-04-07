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
        return [URLQueryItem(name: "q", value: generateQueryString(queryItems: queryItems))]
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
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case type = "Type"
    }
}

