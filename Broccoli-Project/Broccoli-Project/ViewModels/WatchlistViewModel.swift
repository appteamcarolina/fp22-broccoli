//
//  WatchlistViewModel.swift
//  Broccoli-Project
//
//  Created by peter wi on 4/16/22.
//

import Foundation
import CoreData

@MainActor class WatchlistViewModel: ObservableObject {
    
    @Published var mediaType: MediaType = .music
    @Published var entryList : [EntryModel] = []
    
    init() {
        fetchAllEntries()
    }

    func fetchAllEntries() {
        entryList = CoreDataManager.shared.getAllTDItems().map(EntryModel.init)
    }
    
    func fetchFilteredEntriesByType() -> [EntryModel] {
        return entryList.filter { item in
            item.type.contains(mediaType.rawValue)
        }
    }
    
    func addToWatchlist(entry: EntryModel) {
        let existingEntry = CoreDataManager.shared.getEntryDataBy(id: entry.id)
        if let _ = existingEntry {
            return
        }
        
        let entryData = EntryData(context: CoreDataManager.shared.viewContext)
        entryData.type = entry.type
        entryData.name = entry.name
        entryData.yID = entry.yID
        entryData.wTeaser = entry.wTeaser
        entryData.wUrl = entry.wUrl
        entryData.yUrl = entry.yUrl
        entryData.imageUrl = entry.imageUrl
        CoreDataManager.shared.save()
    }
    
    func delete(entry: EntryModel) {
        let existingEntry = CoreDataManager.shared.getEntryDataBy(id: entry.id)
        if let existingEntry = existingEntry {
            CoreDataManager.shared.delete(entry: existingEntry)
        }
    }
}


extension WatchlistViewModel {
    public static var example: WatchlistViewModel {
        let out = WatchlistViewModel()
        return out
    }
}
