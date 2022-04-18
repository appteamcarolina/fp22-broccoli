//
//  TDItem.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 4/18/22.
//

import Foundation

struct TDItem: Codable, Equatable {
    let name: String
    let type: String
    let wTeaser: String
    let wUrl: String
    let yUrl: String?
    let yID: String?
    
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


