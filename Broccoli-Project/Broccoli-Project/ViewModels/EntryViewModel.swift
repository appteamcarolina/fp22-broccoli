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
    @Published var isInWaitlist: Bool = false
    var entryModel: EntryModel?
    
    init(data: TDItem) {
        self.data = data
        imgURLString = nil
    }
    
    init(entry: EntryModel) {
        self.data = TDItem(name: entry.name, type: entry.type, wTeaser: entry.wTeaser, wUrl: entry.wUrl, yUrl: entry.yUrl, yID: entry.yID)
        imgURLString = entry.imageUrl
        entryModel = entry
    }
     
    func fetchImageURL() {
        imgURLString = HTMLParser.getImageURLString(wURLString: data.wUrl)
    }
    
    func addToWatchlist() {
        guard data.name != "", data.type != "", imgURLString != "" else {
            return
        }
        
        if entryModel == nil {
            let entry = EntryData(context: CoreDataManager.shared.viewContext)
            entryModel = EntryModel(entryData: entry)
        }
        
        guard let entryModel = entryModel else {
            return
        }
        
        entryModel.entryData.type = data.type
        entryModel.entryData.name = data.name
        entryModel.entryData.yID = data.yID
        entryModel.entryData.wTeaser = data.wTeaser
        entryModel.entryData.wUrl = data.wUrl
        entryModel.entryData.yUrl = data.yUrl
        entryModel.entryData.imageUrl = imgURLString
        CoreDataManager.shared.save()
        self.isInWaitlist = true
    }
    
    func deleteFromWatchlist() {
        guard let entryModel = entryModel else {
            return
        }
        
        let existingEntryData = CoreDataManager.shared.getEntryDataBy(id: entryModel.id)
        if let existingEntryData = existingEntryData {
            CoreDataManager.shared.delete(entry: existingEntryData)
            self.entryModel = nil
            self.isInWaitlist = false
        }
    }
}
