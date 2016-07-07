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
    let dataSource = DataSource(dataSourceType: DataSourceType.MainTableView)
    
    // Lazy instantiation of firebase ref
    var firebaseHelper: FirebaseHelper = {
        return FirebaseHelper()
    }()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let userInfo = ["firstName": "test", "lastName": "user2", "nickname": "test2", "email": "test2@hello.com", "imgUrl": "htt://www.imageToFirebase.com"]
    
    var fireInfo = [String:AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        tableView.delegate = self
        dataSource.delegate = self
        
//        firebaseHelper.createUserWithEmail("test2@hello.com", andPassword: "123456")
        firebaseHelper.loginWithEmail("test2@hello.com", andPassword: "123456")

    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        dataSource.addOFirebaseObserver()
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    // TODO:
}

// MARK: - DataSource Delegate
extension MainViewController: DataSourceDelegate {
    func updateData() {
        print(#function)
        tableView.reloadData()
    }
}
