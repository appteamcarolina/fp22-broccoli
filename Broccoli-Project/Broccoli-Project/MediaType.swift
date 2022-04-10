//
//  MediaType.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 4/10/22.
//

import Foundation

enum MediaType: String, CaseIterable {
    case band = "band"
    case movie = "movie"
    case show = "show"
    case book = "book"
    case author = "author"
    
    func toString() -> String {
        if self == MediaType.band {
            return "artist"
        }
        else {
            return self.rawValue
        }
    }
}
