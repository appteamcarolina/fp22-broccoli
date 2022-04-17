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

    func fetchAllEntries() {
        entryList = CoreDataManager.shared.getAllTDItems().map(EntryModel.init)
    }
    
    func fetchFilteredEntriesByType() -> [EntryModel] {
        return entryList.filter { item in
            item.type.contains(mediaType.rawValue)
        }
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
