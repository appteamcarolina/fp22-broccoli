//
//  EntryViewModel.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 4/16/22.
//

import Foundation
import CoreData.NSManagedObjectID

/// View model for a search entry. Accepts a `TDItem` as a parameter, from which it derives most if its data. These objects are essentially wrappers for the `TDItem` data returned by the
/// TasteDiveService. This view model helps the application fetch the image URL of the described media item for the views. It also specifies the method for adding an item to the saved list.
class EntryViewModel: ObservableObject {
    let data: TDItem
    @Published var imgURLString: String?
    var entryID: NSManagedObjectID?
    var entryList: [EntryModel]?
        
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
    
    func isInWatchlist() -> Bool {
        fetchAllEntries()
        guard let entryList = entryList else {
            return false
        }
        
        for entry in entryList {
            if (entry.name == data.name && entry.type == data.type) {
                return true
            }
        }
        return false
    }
    
    private func fetchAllEntries() {
        entryList = CoreDataManager.shared.getAllTDItems().map(EntryModel.init)
    }
    
    func addToWatchlist() {
        if (isInWatchlist()) {
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
