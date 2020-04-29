//
//  ManagedObjectContext.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 29.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//

import CoreData

extension NSManagedObjectContext {
    
    func saveIfChanges() {
        if self.hasChanges {
            do {
                try self.save()
            } catch {
                print("could not save managed object context")
            }
        }
    }
}
