//
//  HTMLParser.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 4/9/22.
//

import Foundation
import SwiftSoup

public final class HTMLParser {
    
    static func getImageURLString(wURLString: String) -> String? {
        do {
            let url = URL(string: wURLString)!
            let html = try String(contentsOf: url)
            let doc = try SwiftSoup.parse(html)
            let infobox = try doc.getElementsByClass("infobox-image").first()
            guard infobox != nil else {return nil }
            let excerpt = try SwiftSoup.parseBodyFragment(infobox!.outerHtml())
            let images = try excerpt.select("img")
            let first = try images.first()!.attr("src")
            return ("https:\(first)")
        }
        catch {
            print("Couldn't fetch image. Error: \(error.localizedDescription)")
            return nil
        }
        
        
    }
}
