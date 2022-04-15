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
            return Color.red
        case .movie:
            return Color.orange
        case .show:
            return Color.yellow
        case .book:
            return Color.mint
        case .author:
            return Color.purple
        }
    }
    
    func intValue() -> Int {
        switch self {
        case .music:
            return 0
        case .movie:
            return 1
        case .show:
            return 2
        case .book:
            return 3
        case .author:
            return 4
        }
    }
}
