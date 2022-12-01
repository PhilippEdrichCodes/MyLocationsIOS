//
//  LocationDetailViewController.swift
//  MyLocationsIOS
//
//  Created by Philipp Edrich on 17.11.22.
//

import UIKit

class LocationDetailViewController: UIViewController {
    
    var location: Location!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var w3wLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = location.name
        descriptionLabel.text = location.description
        w3wLabel.text = location.w3w
//        longitudeLabel.text = String(location.coords.longitude)
//        latitudeLabel.text = String(location.coords.latitude)

    }

}
