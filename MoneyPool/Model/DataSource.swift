//
//  DataStore.swift
//  MoneyPool
//
//  Created by Jorge Bastos on 7/5/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit
import Firebase

protocol DataSourceDelegate {
    func updateData()
}

class DataSource: NSObject {
    
    // Delegation
    var delegate: DataSourceDelegate?
    
    // Lazy instantiation of firebase ref
    private var firebaseHelper: FirebaseHelper = {
        return FirebaseHelper()
    }()
    
    var moneyPoolData = [MoneyPoolType]()
    
    func observerForDataUpdate() {
        addOFirebaseObserver()
    }
    
    // MARK: - Firebase Observers API
    func addOFirebaseObserver() {
        firebaseHelper.addValueObserverForRefPoint(RefPoint.Pools) { (snapShot: FIRDataSnapshot) in
            guard let poolsSnap = snapShot.value as? [String:[String:AnyObject]] else {
                ErrorHandling.customErrorMessage("Error fetching data from firebase")
                return }
            // clear data before update
            self.moneyPoolData.removeAll(keepCapacity: true)
            for (_, value) in poolsSnap {
                let pool = Pool(info: value)
                self.moneyPoolData.append(pool)
                print(pool)
            }
            self.delegate?.updateData()
            print(self.moneyPoolData.count, #function)
        }
    }
    
}

// MARK: TableView DataSource
extension DataSource: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moneyPoolData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // get data from moneyPoolData array
        let pool = moneyPoolData[indexPath.row] as! Pool
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PoolTableViewCell", forIndexPath: indexPath) as! PoolTableViewCell
        cell.titleLabel.text = pool.eventName
        cell.toRaiseLabel.text = "\(pool.amountGoal)"
        cell.leftToRaiseLabel.text = "\(pool.amountGoal - pool.amountRised)"
        return cell
    }
    
}




//    func configureViewCell() {
//        // check for the data type
//        if cellData is PoolTableViewCell {
//            let cell = tableView.dequeueReusableCellWithIdentifier("PoolTableViewCell", forIndexPath: indexPath) as! PoolTableViewCell
//            // configure cell view
//            cell.configure(cellData)
//            return PoolTableViewCell()
//        } else {
//            let cell = tableView.dequeueReusableCellWithIdentifier("InvitaionTableViewCell", forIndexPath: indexPath) as! InvitaionTableViewCell
//            return InvitaionTableViewCell()
//        }
//    }
