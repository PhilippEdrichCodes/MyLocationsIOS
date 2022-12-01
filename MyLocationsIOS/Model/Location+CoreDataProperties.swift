//
//  Location+CoreDataProperties.swift
//  MyLocationsIOS
//
//  Created by Philipp Edrich on 01.12.22.
//
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var name: String?
    @NSManaged public var desc: String?
    @NSManaged public var w3w: String?
    @NSManaged public var coords: Coords?

}

extension Location : Identifiable {

}
