//
//  LoginViewController.swift
//  MoneyPool
//
//  Created by Edrick Pascual on 7/7/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var notUserLabel: UILabel!
    
    
    @IBAction func loginTappedButton(sender: UIButton) {
        if loginButton.titleLabel?.text == "LOGIN" {
            login(emailTextField.text!, password: passwordTextfield.text!)
            
        } else {
            
            createUser(emailTextField.text!, password: passwordTextfield.text!)
        
        }
        
        // If success go to MainScreenViewController
        
        
    }
    
    @IBAction func registerTappedButton(sender: UIButton) {
        if loginButton.titleLabel?.text == "LOGIN" {
            loginButton.setTitle("SIGN UP", forState: .Normal)
            signupButton.setTitle("LOGIN", forState: .Normal)
            notUserLabel.text = "Login instead?"
            
        } else {
            loginButton.setTitle("LOGIN", forState: .Normal)
            signupButton.setTitle("SIGN UP", forState: .Normal)
            notUserLabel.text = "Not a user yet?"
        }
    }
    
    func login (email: String, password: String) {
        FIRAuth.auth()?.signInWithEmail(email, password: password, completion: { user, error in
            if error != nil {
                // user not found
                self.createUser(email, password: password)
                print("incorrect")
            } else {
                print("Success")
            }
        })
    }
    
    func createUser(email: String, password: String) {
        FIRAuth.auth()?.createUserWithEmail(email, password: password, completion: { user, error in
            if error != nil {
                
            } else {
                print("User Created")
                self.login(email, password: password)
            }
            
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
