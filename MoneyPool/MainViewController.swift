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
    
    let userInfo = ["firstName": "test5", "lastName": "user5", "nickname": "test5", "email": "test5@hello.com", "imgUrl": "htt://www.imageToFirebase.com"]
    
    var fireInfo = [String:AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentUser = FIRAuth.auth()?.currentUser {
            performSegueWithIdentifier("presentLoginViewController", sender: nil)
        }
        
        tableView.dataSource = dataSource
        tableView.delegate = self
        dataSource.delegate = self
        
        firebaseHelper.loginWithEmail("test5@hello.com", andPassword: "123456")
//        firebaseHelper.createUserWithEmail("test5@hello.com", andPassword: "123456")

    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        dataSource.addOFirebaseObserverForRefPoint(RefPoint.Pools)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        // remove firebase observer
        dataSource.removeObserverForRefPoint(RefPoint.Pools)
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showActivePoolViewController" {
            guard let activeVC =  segue.destinationViewController as? ActivePoolViewController, indexPath = tableView.indexPathForSelectedRow else { return }
            let pool = dataSource.moneyPoolData[indexPath.row]
            print(#function, pool)
            activeVC.pool = pool as? Pool
        }
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
