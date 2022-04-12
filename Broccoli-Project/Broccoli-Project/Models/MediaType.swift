//
//  MediaType.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 4/10/22.
//

import Foundation
import SwiftUI

enum MediaType: String, CaseIterable {
    case music = "music"
    case movie = "movie"
    case show = "show"
    case book = "book"
    case author = "author"
    
    func toString() -> String {
        if self == MediaType.music {
            return "Artist"
        }
        else {
            return self.rawValue.capitalized
        }
    }
    
    func getColor() -> Color {
        switch self {
        case .music:
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
