//
//  DataStore.swift
//  MoneyPool
//
//  Created by Jorge Bastos on 7/5/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit

protocol DataSourceDelegate {
    
}

class DataSource: NSObject {
    
    var moneyPoolData = [MoneyPoolType]()
    
    
    // MARK: - TableViewCell
    
}

// MARK: TableView DataSource
extension DataSource: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 //moneyPoolData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // get data from moneyPoolData array
        let cellData = moneyPoolData[indexPath.row]
        
        // check for the data type
        if cellData is PoolTableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("PoolTableViewCell", forIndexPath: indexPath) as! PoolTableViewCell
            // configure cell view
            cell.configure(cellData)
            return PoolTableViewCell()
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("InvitaionTableViewCell", forIndexPath: indexPath) as! InvitaionTableViewCell
            return InvitaionTableViewCell()
        }
    }
}


