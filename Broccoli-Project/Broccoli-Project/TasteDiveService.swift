//
//  TasteDiveService.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 3/31/22.
//

import Foundation

public final class TasteDiveService {
    
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

