//
//  Repository.swift
//  MyLocationsIOS
//
//  Created by Philipp Edrich on 02.12.22.
//

import UIKit
import CoreData

struct AppRepository {
    
    fileprivate var locations: [Location]
    fileprivate let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    mutating func fetchLocations() {
        do {
            self.locations = try context.fetch(Location.fetchRequest())
        } catch {
            print("Wir konnten leider die Kontakte nicht fetchen.")
        }
        notifyObservers()
    }
    
    func getLocations() -> [Location] {
        return self.locations
    }
    
    func getContext() -> NSManagedObjectContext {
        return self.context
    }
    
    mutating func updateLocation(at index: Int, with location: Location) {
        self.locations[index] = location
        notifyObservers()
    }
    
    mutating func addLocation(name: String, description: String, w3w: String, longitude: Float, latitude: Float) {
        
        let newLocation = Location(context: self.context)
        
        newLocation.name = name
        newLocation.desc = description
        newLocation.w3w = w3w
        
        newLocation.coords = Coords()
        newLocation.coords?.longitude = longitude
        newLocation.coords?.latitude = latitude
        
        do {
            try self.context.save()
        } catch {
            print(error.localizedDescription)
        }
        
        notifyObservers()
    }
    
    mutating func deleteLocation(_ location: Location) {
        for index in 0 ... self.locations.count {
            if self.locations[index].name == location.name {
                deleteLocation(at: index)
            }
        }
    }
    
    mutating func deleteLocation(at index: Int) {
        let locationToDelete = self.locations[index]
        do {
            self.context.delete(locationToDelete)
            try self.context.save()
            self.locations.remove(at: index)
        } catch {
            print(error.localizedDescription)
        }
        notifyObservers()
    }
    
    func notifyObservers() {
        NotificationCenter.default.post(name: Notification.Name("repositoryListChanged"), object: nil)
    }
}
