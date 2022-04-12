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
            guard let infobox = try doc.getElementsByClass("infobox-image").first() else {
                print("Couldn't find the infobox")
                return getFirstImageURLString(wURLString: wURLString)
                
            }
            let excerpt = try SwiftSoup.parseBodyFragment(infobox.outerHtml())
            let images = try excerpt.select("img")
            guard let first = images.first() else {
                print("Couldn't find the first image")
                return nil
                
            }
            let source = try first.attr("src")
            return ("https:\(source)")
        }
        catch {
            print("Couldn't fetch image. Error: \(error.localizedDescription)")
            return nil
        }
        
        
    }
    
    static func getFirstImageURLString(wURLString: String) -> String? {
        do {
            let url = URL(string: wURLString)!
            let html = try String(contentsOf: url)
            let doc = try SwiftSoup.parse(html)
            guard let firstImage = try doc.select("img").first() else {
                print("Couldn't find images")
                return nil
                
            }
            let source = try firstImage.attr("src")
            return ("https:\(source)")
        }
        catch {
            print("Couldn't fetch image. Error: \(error.localizedDescription)")
            return nil
        }
    }
}
