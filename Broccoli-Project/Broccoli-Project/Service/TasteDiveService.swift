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
        //print(decodedResponse)
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




/// The initial TasteDive API response. Not used anywhere outside of the decoding context.
struct TDResponse: Decodable {
    let data: TDSimilarData
    
    enum CodingKeys: String, CodingKey {
        case data = "Similar"
    }
}

/// An intermediate struct in the decoding of a TasteDive API response. Not used anywhere outside of the decoding context.
struct TDSimilarData: Decodable {
    
    let results: [TDItem]
    enum CodingKeys: String, CodingKey {
        case results = "Results"
    }
    
}


