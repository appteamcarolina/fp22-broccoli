//
//  CoreDataManager.swift
//  Broccoli-Project
//
//  Created by peter wi on 4/16/22.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func getAllTDItems() -> [EntryData] {
        let request: NSFetchRequest<EntryData> = EntryData.fetchRequest()
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    func getEntryDataBy(id: NSManagedObjectID) -> EntryData? {
        do {
            return try viewContext.existingObject(with: id) as? EntryData
        } catch {
            return nil
        }
    }
    
    func delete(entry: EntryData) {
        viewContext.delete(entry)
        save()
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "DataModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data Stack \(error)")
            }
            
        }
    }
}
