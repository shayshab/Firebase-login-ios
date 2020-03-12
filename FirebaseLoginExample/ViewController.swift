//
//  ViewController.swift
//  FirebaseLoginExample
//
//  Created by DhakaLive on 2/27/20.
//  Copyright © 2020 DhakaLive. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextFields
import FirebaseAuth

class ViewController: UIViewController, UITextFieldDelegate {
    
    
  
    @IBOutlet weak var signInSelector: UISegmentedControl!
    @IBOutlet weak var txtEmail: MDCTextField!
    @IBOutlet weak var txtPassword: MDCTextField!
    @IBOutlet weak var btnSignIn: UIButton!
    
    var email: MDCTextInputControllerOutlined?
    var password: MDCTextInputControllerOutlined?
    
    var isSignIn: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        email = MDCTextInputControllerOutlined(textInput: txtEmail)
        password = MDCTextInputControllerOutlined(textInput: txtPassword)
    }

    @IBAction func signInSelectorChange(_ sender: UISegmentedControl) {
        isSignIn = !isSignIn
        
        if isSignIn {
            btnSignIn.setTitle("Sign In", for: .normal)
        }
        else {
            btnSignIn.setTitle("Register", for: .normal)
        }
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        if let email = txtEmail.text, let password = txtPassword.text {
            if isSignIn {
                Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                    if let u = user{
                        self.performSegue(withIdentifier: "goToHome", sender: nil)
                    }
                    else {
                        
                    }
                }
            }
            else {
                Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                    if let u = user {
                        self.performSegue(withIdentifier: "goToHome", sender: nil)
                    }
                    else {
                        
                    }
                }
            }
        }
        
    }

}

