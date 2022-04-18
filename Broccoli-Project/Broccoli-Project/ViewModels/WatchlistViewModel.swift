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
    
    @Published var curType: String?
    @Published var curName: String?
    @Published var curYID: String?
    @Published var curWTeaser: String?
    @Published var curWUrl: String?
    @Published var curYUrl: String?
    @Published var curImageUrl: String?
    
    var curEntryModel: EntryModel?
    
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
    
    func updateCurEntry(entry: EntryModel) {
        curType = entry.type
        curName = entry.name
        curYID = entry.yID
        curWTeaser = entry.wTeaser
        curWUrl = entry.wUrl
        curYUrl = entry.yUrl
        curImageUrl = entry.imageUrl
        curEntryModel = entry
    }
    
    func addToWatchlist() {
        guard let curEntryModel = curEntryModel else {
            return
        }
        
        let existingEntry = CoreDataManager.shared.getEntryDataBy(id: curEntryModel.id)
        if let _ = existingEntry {
            return
        }
        
        let entryData = EntryData(context: CoreDataManager.shared.viewContext)
        entryData.type = curType
        entryData.name = curName
        entryData.yID = curYID
        entryData.wTeaser = curWTeaser
        entryData.wUrl = curWUrl
        entryData.yUrl = curYUrl
        entryData.imageUrl = curImageUrl
        CoreDataManager.shared.save()
        self.curEntryModel = EntryModel(entryData: entryData)
    }
    
    func deleteFromWatchList() {
        guard let curEntryModel = curEntryModel else {
            return
        }

        let existingEntry = CoreDataManager.shared.getEntryDataBy(id: curEntryModel.id)
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
