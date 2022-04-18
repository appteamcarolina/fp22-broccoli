//
//  TDQuery.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 4/18/22.
//

import Foundation

/// A data struct that describes a query item for the TasteDive service. It only needs to store the name and type of the search item.
/// An array of `TDQuery` structs are passed to the TasteDive service, which then processes them into an HTTPS query for the API
/// Example: `TDQuery(name: "Pink Floyd", type: MediaType.music)` describes the band Pink Floyd.
///
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
