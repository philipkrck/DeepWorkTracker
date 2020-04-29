//
//  Session+CoreDataProperties.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 29.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//
//

import Foundation
import CoreData


extension Session {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Session> {
        return NSFetchRequest<Session>(entityName: "Session")
    }

    @NSManaged public var date: Date?
    @NSManaged public var duration: Double
    @NSManaged public var category: Category?
    
    public var wrappedDate: Date {
        date ?? Date()
    }
    
    public var wrappedCategory: Category {
        category ?? Category()
    }

}
