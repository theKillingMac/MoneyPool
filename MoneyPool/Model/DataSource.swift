//
//  DataStore.swift
//  MoneyPool
//
//  Created by Jorge Bastos on 7/5/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit
import Firebase


enum DataSourceType: String {
    case MainTableView = "MainTableView"
//    case PoolTableViewCell = "PoolTableViewCell"
//    case InvitaionTableViewCell = "InvitaionTableViewCell"
//    case PoolInvitationFriendListTableViewCell = "PoolInvitationFriendListTableViewCell"
    case InviteFriendListTableViewCell = "InviteFriendListTableViewCell"
}

protocol DataSourceDelegate {
    func updateData()
}

class DataSource: NSObject {
    
    // Delegation
    var delegate: DataSourceDelegate?
    private let dataSource: DataSourceType
    
    // Lazy instantiation of firebase ref
    private var firebaseHelper: FirebaseHelper = {
        return FirebaseHelper()
    }()
    
    
    var moneyPoolData = [MoneyPoolType]()
    
    
    init(dataSourceType: DataSourceType) {
        self.dataSource = dataSourceType
    }
    
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
    
    /// Fetch firebase from refPoint
    /// - refPoint: reference pinter in firebase database
    func addOFirebaseObserverForRefPoint(refPoint: RefPoint) {
        firebaseHelper.addValueObserverForRefPoint(refPoint) { (snapShot: FIRDataSnapshot) in
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
    
    /// Save to firebase database any type
    /// that conforms to MoneyPool protocol
    func saveToDatabase(file: MoneyPoolType) {
        switch file {
        case let file as User:
            firebaseHelper.saveData(file, toRefPoint: RefPoint.Users)
        case let file as Pool:
            firebaseHelper.saveData(file, toRefPoint: RefPoint.Pools)
        case let file as Invitation:
            firebaseHelper.saveData(file, toRefPoint: RefPoint.Invitations)
        default:
            ErrorHandling.customErrorMessage("Error Saving file to firebase")
            break
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
        let cellData = moneyPoolData[indexPath.row]
        
        switch dataSource {
        case .MainTableView:
            if cellData is Pool {
                let cell = tableView.dequeueReusableCellWithIdentifier("PoolTableViewCell", forIndexPath: indexPath) as! PoolTableViewCell
                cell.configure(cellData)
                return cell
            } else {
                let cell = tableView.dequeueReusableCellWithIdentifier("InvitaionTableViewCell", forIndexPath: indexPath) as! InvitaionTableViewCell
                cell.configure(cellData)
                return cell
            }
//        case .PoolTableViewCell:
//            let cell = tableView.dequeueReusableCellWithIdentifier(dataSource.rawValue, forIndexPath: indexPath) as! PoolTableViewCell
//            cell.configure(cellData)
//            return cell
//        case .InvitaionTableViewCell:
//            let cell = tableView.dequeueReusableCellWithIdentifier(dataSource.rawValue, forIndexPath: indexPath) as! InvitaionTableViewCell
//            cell.configure(cellData)
//            return cell
        case .InviteFriendListTableViewCell:
            let cell = tableView.dequeueReusableCellWithIdentifier(dataSource.rawValue, forIndexPath: indexPath) as! InviteFriendListTableViewCell
            cell.configure(cellData)
            return cell
//        case .PoolInvitationFriendListTableViewCell:
//            let cell = tableView.dequeueReusableCellWithIdentifier(dataSource.rawValue, forIndexPath: indexPath) as! PoolInvitationFriendListTableViewCell
//            cell.configure(cellData)
//            return cell
        }
    }
    
}