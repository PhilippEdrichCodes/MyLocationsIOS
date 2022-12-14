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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let pass = passwordTextField.text
        {
            if email == "" {
                emailTextField.placeholder = "Please enter your email!"
            }
            if pass == "" {
                passwordTextField.placeholder = "Please enter a password!"
            }
            if email == "", pass == "" {
                let alert = UIAlertController(title: "No Credentials given", message: "Please enter your credentials" , preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .cancel) { _ in return }
                alert.addAction(ok)
                present(alert, animated: true, completion: nil)
            } else {
                
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

}
