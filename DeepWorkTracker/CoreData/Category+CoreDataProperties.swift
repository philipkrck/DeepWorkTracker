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
import SwiftUI

extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var colorName: String?
    @NSManaged public var name: String?
    @NSManaged public var sessions: NSSet?
    
    public var wrappedName: String {
        name ?? "Unknown name"
    }
    
    public var sessionsArray: [Session] {
        let set = sessions as? Set<Session> ?? []
        
        return set.sorted {
            $0.wrappedDate < $1.wrappedDate
        }
    }
    
    public var color: Color {
        get {
            switch colorName {
            case "red":
                return Color.red
            case "green":
                return Color.green
            case "blue":
                return Color.blue
            case "black":
                return Color.black
            case "gray":
                return Color.gray
            case "orange":
                return Color.orange
            case "purple":
                return Color.purple
            case "pink":
                return Color.pink
            default:
                return Color.black
            }
        }
        
        set {
            switch newValue {
            case .red:
                colorName = "red"
            case .green:
                colorName = "green"
            case .blue:
                colorName = "blue"
            case .black:
                colorName = "black"
            case .gray:
                colorName = "gray"
            case .orange:
                colorName = "orange"
            case .purple:
                colorName = "purple"
            case .pink:
                colorName = "pink"
            default:
                colorName = "black"
            }
        }
    }

    public static var mockCategory: Category {
        let category = Category()
        category.name = "Default"
        category.color = .orange
        return category
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
