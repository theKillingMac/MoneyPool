//
//  ViewController.swift
//  MoneyPool
//
//  Created by Jorge Bastos on 7/5/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
        // Create a reference to Firebase database
        print(ref)
        
        
//        // Create a user in firebase
//        FIRAuth.auth()?.createUserWithEmail("test@hello.com", password: "123456", completion: { (user: FIRUser?, error: NSError?) in
//            if error != nil {
//                print("Error cretaing user in firebase \(error?.localizedDescription)")
//            } else {
//                self.user = user!
//                print(self.user)
//            }
//        })
        
//        if user != nil {
//            FIRAuth.auth()?.signInWithEmail("test@hello.com", password: "123456", completion: { (user: FIRUser?, error: NSError?) in
//                if error != nil {
//                    print("Error cretaing user in firebase \(error?.localizedDescription)")
//                    
//                }
//            })
//
//        }
        
        FIRAuth.auth()?.signInWithEmail("test@hello.com", password: "123456", completion: { (user: FIRUser?, error: NSError?) in
            if error != nil {
                print("Error cretaing user in firebase \(error?.localizedDescription)")
                
            } else if let user = user {
                let userInfo = ["username": "Test user", "email": "test@hello.com"]
                
                // get ref to user in firebase database
                let userRef = self.ref.child(user.uid)
                // add user data to user database 
                userRef.setValue(userInfo)
                
                // get ref to pools in firebase database
                let poolRef = self.ref.child("pools")
                // create pool in the pools database with auto id
                let pool = poolRef.childByAutoId()
                
                // create pool data
                let poolData = ["title": "MY First Pool", "pool description": "This is a test pool", "amount": 200, "groupesNumber": 10]
                
                // add pool information to the pool in firebase
                pool.setValue(poolData)
                
                
            }
        })

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

