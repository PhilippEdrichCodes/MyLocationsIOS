//
//  Coords+CoreDataProperties.swift
//  MyLocationsIOS
//
//  Created by Philipp Edrich on 01.12.22.
//
//

import Foundation
import CoreData


extension Coords {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Coords> {
        return NSFetchRequest<Coords>(entityName: "Coords")
    }

    @NSManaged public var longitude: Float
    @NSManaged public var latitude: Float
    @NSManaged public var location: Location?

}

extension Coords : Identifiable {

}
