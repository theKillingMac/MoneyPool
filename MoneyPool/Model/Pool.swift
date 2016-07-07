//
//  Pool.swift
//  MoneyPool
//
//  Created by Jorge Bastos on 7/5/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import Foundation

struct Pool: MoneyPoolType, FirebaseConvertible {
    
    
    let eventName: String
    let amountGoal: Double
    let poolDescription: String
    // reference
    
    init(info: [String : AnyObject]) {
        // TODO: implement
        self.eventName = info["eventName"] as! String
        self.amountGoal = info["amountGoal"] as! Double
        self.poolDescription = info["poolDescription"] as! String
    }
    
    func converToFirebase() -> [String:AnyObject] {
        var fireInfo = [String:AnyObject]()
        fireInfo["eventName"] = self.eventName
        fireInfo["amountGoal"] = self.amountGoal
        fireInfo["poolDescription"] = self.poolDescription

        return fireInfo
    }
}