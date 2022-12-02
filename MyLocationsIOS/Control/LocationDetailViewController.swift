//
//  LocationDetailViewController.swift
//  MyLocationsIOS
//
//  Created by Philipp Edrich on 17.11.22.
//

import UIKit

class LocationDetailViewController: UIViewController {
    
    var location: Location?
    var isInEditMode = false
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    
    @IBOutlet weak var w3wLabel: UILabel!
    @IBOutlet weak var w3wTextField: UITextField!
    
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var longitudeTextField: UITextField!
    
    
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var latitudeTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        switchEditMode()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let loc = location
        {
            nameLabel.text = loc.name
            nameTextField.text = loc.name
            
            descriptionLabel.text = loc.desc
            descriptionTextField.text = loc.desc
            
            w3wLabel.text = loc.w3w
            w3wTextField.text = loc.w3w
            
            let longitudeString = String(describing: loc.coords?.longitude)
            longitudeLabel.text = longitudeString
            longitudeTextField.text = longitudeString
            
            let latitudeString = String(describing: loc.coords?.latitude)
            latitudeLabel.text = latitudeString
            latitudeTextField.text = latitudeString
        }
    }
    
    @IBAction func editModeButtonPressed(_ sender: UIBarButtonItem) {
        isInEditMode = !isInEditMode
        switchEditMode()
    }
    
    func switchEditMode() {
        if isInEditMode {
            nameLabel.isHidden = true
            nameTextField.isHidden = false
            nameTextField.isEnabled = true
            
            descriptionLabel.isHidden = true
            descriptionTextField.isHidden = false
            descriptionLabel.isEnabled = true
            
            w3wLabel.isHidden = true
            w3wTextField.isHidden = false
            w3wTextField.isEnabled = true
            
            latitudeLabel.isHidden = true
            latitudeTextField.isHidden = false
            latitudeTextField.isEnabled = true
            
            longitudeLabel.isHidden = true
            longitudeTextField.isHidden = false
            longitudeTextField.isEnabled = true
        }
        else
        {
            nameLabel.isHidden = false
            nameTextField.isHidden = true
            nameTextField.isEnabled = false
            
            descriptionLabel.isHidden = false
            descriptionTextField.isHidden = true
            descriptionLabel.isEnabled = false
            
            w3wLabel.isHidden = false
            w3wTextField.isHidden = true
            w3wTextField.isEnabled = false
            
            latitudeLabel.isHidden = false
            latitudeTextField.isHidden = true
            latitudeTextField.isEnabled = false
            
            longitudeLabel.isHidden = false
            longitudeTextField.isHidden = true
            longitudeTextField.isEnabled = false
        }
    }
}
