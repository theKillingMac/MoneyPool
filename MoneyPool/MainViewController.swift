//
//  MainViewController.swift
//  MoneyPool
//
//  Created by Jorge Bastos on 7/5/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {
    
    // Data Source Handler
    let dataSource = DataSource()
    
    // Lazy instantiation of firebase ref
    var firebaseHelper: FirebaseHelper = {
        return FirebaseHelper()
    }()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let userInfo = ["firstName": "test", "lastName": "user2", "nickname": "test2", "email": "test2@hello.com", "imgUrl": "htt://www.imageToFirebase.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        tableView.delegate = self
        
//        firebaseHelper.createUserWithEmail("test2@hello.com", andPassword: "123456")
        firebaseHelper.loginWithEmail("test2@hello.com", andPassword: "123456")
        
        let user = User(info: userInfo)
        
        // saving user to firebase
        firebaseHelper.saveData(user, toRefPoint: .Users)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        // firebase observer for changes
        firebaseHelper.addValueObserverForRefPoint(RefPoint.Users) { (usersSnapshot: FIRDataSnapshot) in
            print("Printing user data from firebase \(usersSnapshot)")
            
        }
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    // TODO:
}





