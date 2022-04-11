//
//  MediaType.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 4/10/22.
//

import Foundation
import SwiftUI

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
    
    func getColor() -> Color {
        switch self {
        case .band:
            return Color.blue
        case .movie:
            return Color.red
        case .show:
            return Color.indigo
        case .book:
            return Color.mint
        case .author:
            return Color.teal
        }
    }
}
