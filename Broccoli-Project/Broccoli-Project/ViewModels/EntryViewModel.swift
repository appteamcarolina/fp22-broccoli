//
//  EntryViewModel.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 4/16/22.
//

import Foundation

class EntryViewModel: ObservableObject {
    let data: TDItem
    @Published var imgURLString: String?
    
    init(data: TDItem) {
        self.data = data
        imgURLString = nil
    }
     
    func fetchImageURL() {
        imgURLString = HTMLParser.getImageURLString(wURLString: data.wUrl)
    }
}
