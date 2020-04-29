//
//  Category+CoreDataProperties.swift
//  DeepWorkTracker
//
//  Created by Philip Krück on 29.04.20.
//  Copyright © 2020 Philip Krück. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var colorName: String?
    @NSManaged public var name: String?
    @NSManaged public var sessions: NSSet?
    
    public var wrappedColorName: String {
        colorName ?? "Unknown color name"
    }
    
    public var wrappedName: String {
        name ?? "Unknown name"
    }
    
    public var sessionsArray: [Session] {
        let set = sessions as? Set<Session> ?? []
        
        return set.sorted {
            $0.wrappedDate < $1.wrappedDate
        }
    }

}

// MARK: Generated accessors for sessions
extension Category {

    @objc(addSessionsObject:)
    @NSManaged public func addToSessions(_ value: Session)

    @objc(removeSessionsObject:)
    @NSManaged public func removeFromSessions(_ value: Session)

    @objc(addSessions:)
    @NSManaged public func addToSessions(_ values: NSSet)

    @objc(removeSessions:)
    @NSManaged public func removeFromSessions(_ values: NSSet)

}
