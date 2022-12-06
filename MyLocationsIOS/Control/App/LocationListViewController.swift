//
//  LocationListViewController.swift
//  MyLocationsIOS
//
//  Created by Philipp Edrich on 17.11.22.
//

import UIKit

class LocationListViewController: KeyboardFriendlyViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let sectionsList: [String] = ["Personal", "Well Known"]
    
    var locationList: [Location] =
    [
//        Location(name: "Home", description: "myHome", w3w: "///at.my.home", coords: Coords(longitude: -1.0, latitude: -2.0)),
//        Location(name: "Work", description: "myWorkPlace", w3w: "///my.work.place", coords: Coords(longitude: -3.0, latitude: 4.6)),
//        Location(name: "Hell", description: "Hells Bells", w3w: "///yeah.hells.bells", coords: Coords(longitude: -6.66, latitude: -6.66))
    ]
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func addLocation(_ sender: UIBarButtonItem) {
    }
    
    func fetchLocations() {
        do {
            self.locationList = try context.fetch(Location.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print("Wir konnten leider die Locations nicht fetchen.")
        }
    }
}

// MARK: - UITableView

// MARK: - UITableViewDataSource

extension LocationListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let location = locationList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as! LocationCell
        cell.nameLabel.text = location.name
        cell.descriptionLabel.text = location.desc
        cell.w3wLabel.text = location.w3w
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension LocationListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "", sender: self)
    }
    
}
