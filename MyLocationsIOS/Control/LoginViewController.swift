//
//  LoginViewController.swift
//  MyLocationsIOS
//
//  Created by Philipp Edrich on 01.12.22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let pass = passwordTextField.text
        {
            if email == "", pass == "" {
                
            }
            
            Auth.auth().signIn(withEmail: email, password: pass) {
                authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "TODO", sender: self)
                }
            }
            
        }
    }

}
