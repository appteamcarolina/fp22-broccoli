//
//  EntryViewModel.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 4/16/22.
//

import Foundation
import CoreData.NSManagedObjectID

class EntryViewModel: ObservableObject {
    let data: TDItem
    @Published var imgURLString: String?
    var entryID: NSManagedObjectID?
    
    init(data: TDItem) {
        self.data = data
        imgURLString = nil
    }
     
    func fetchImageURL() {
        let imgURL = HTMLParser.getImageURLString(wURLString: data.wUrl)
        DispatchQueue.main.async {
            self.imgURLString = imgURL
        }
    }
    
    func addToWatchlist() {
        guard data.name != "", data.type != "", imgURLString != "" else {
            return
        }
        
        let entry = EntryData(context: CoreDataManager.shared.viewContext)
        entry.type = data.type
        entry.name = data.name
        entry.yID = data.yID
        entry.wTeaser = data.wTeaser
        entry.wUrl = data.wUrl
        entry.yUrl = data.yUrl
        entry.imageUrl = imgURLString
        CoreDataManager.shared.save()
        entryID = entry.objectID
    }
    
    func deleteFromWatchlist() {
        guard let entryID = entryID else {
            return
        }
        
        let existingEntryData = CoreDataManager.shared.getEntryDataBy(id: entryID)
        if let existingEntryData = existingEntryData {
            CoreDataManager.shared.delete(entry: existingEntryData)
        }
    }
}
