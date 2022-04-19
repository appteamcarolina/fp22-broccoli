//
//  EntryModel.swift
//  Broccoli-Project
//
//  Created by peter wi on 4/16/22.
//

import Foundation
import CoreData

struct EntryModel {
    let entryData: EntryData
    
    var id: NSManagedObjectID {
        return entryData.objectID
    }
    
    var type: String {
        return entryData.type ?? ""
    }
    
    var name: String {
        return entryData.name ?? ""
    }
    
    var wTeaser: String {
        return entryData.wTeaser ?? ""
    }
    
    var wUrl: String {
        return entryData.wUrl ?? ""
    }
    
    var yUrl: String {
        return entryData.yUrl ?? ""
    }
    
    var yID: String {
        return entryData.yID ?? ""
    }
    
    var imageUrl: String {
        return entryData.imageUrl ?? ""
    }
}
