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
    @NSManaged public var session: NSSet?

}

// MARK: Generated accessors for session
extension Category {

    @objc(addSessionObject:)
    @NSManaged public func addToSession(_ value: Session)

    @objc(removeSessionObject:)
    @NSManaged public func removeFromSession(_ value: Session)

    @objc(addSession:)
    @NSManaged public func addToSession(_ values: NSSet)

    @objc(removeSession:)
    @NSManaged public func removeFromSession(_ values: NSSet)

}
