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
            let images = try doc.select("img")
            let first = try images.first()!.attr("src")
            return ("https:\(first)") // returns URL of first image on the page
        }
        catch {
            print("Couldn't fetch image. Error: \(error.localizedDescription)")
            return nil
        }
        
        
    }
}
