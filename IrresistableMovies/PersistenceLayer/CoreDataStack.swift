//
//  CoreDataStack.swift
//  IrresistableMovies
//
//  Created by Mohammad Zulqarnain on 02/07/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import CoreData

class CoreDataStack {

    lazy var managedObjectContext: NSManagedObjectContext = {
        let container = self.persistentContainer
        return container.viewContext
    }()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "IrresistableMovies")
        container.loadPersistentStores() { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error: \(error) , \(error.userInfo)")
            }
        }
        return container
    }()
}

extension NSManagedObjectContext {
    
    func saveChanges() {
        if self.hasChanges {
            do {
                try save()
            } catch let error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
}
