//
//  HTMLParser.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 4/9/22.
//

import Foundation
import SwiftSoup

/**
This class is responsible for parsing the HTML of Wikipedia and finding image profiles for the media items returned by the TasteDive search.
 */
public final class HTMLParser {
    
    /**
     Fetches the image URL of the media item using its Wikipedia URL. It will try to find the image in the infobox.
     If this is not available, the first image on the page will be used.

     - Parameter wURLString: The URL String of the wikipedia page needing to be scraped. This will come from the data fetched from TasteDive.

     - Returns: An optional String. If no image can be found (because of any error), the function returns nil. Otherwise, the function will return the URL String of the image.
     */
    
    static func getImageURLString(wURLString: String) -> String? {
        do {
            guard let url = URL(string: wURLString) else {
                print("Invalid URL")
                return nil
            }
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
    
    /**
     Fetches the image URL of the first image on the wikipedia page.

     - Parameter wURLString: The URL String of the wikipedia page needing to be scraped.

     - Returns: An optional String. If no image can be found (because of any error), the function returns nil. Otherwise, the function will return the URL String of the image.
     */
    static func getFirstImageURLString(wURLString: String) -> String? {
        do {
            guard let url = URL(string: wURLString) else {
                print("Invalid URL")
                return nil
            }
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
