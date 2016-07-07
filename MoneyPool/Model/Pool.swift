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
    let amountRised: Double
    let poolDescription: String
    
    init(info: [String : AnyObject]) {
        self.eventName = info["eventName"] as! String
        self.amountGoal = info["amountGoal"] as! Double
        self.amountRised = info["raised"] as! Double
        self.poolDescription = info["poolDescription"] as! String
    }
    
    func converToFirebase() -> [String:AnyObject] {
        var fireInfo = [String:AnyObject]()
        fireInfo["eventName"] = self.eventName
        fireInfo["amountGoal"] = self.amountGoal
        fireInfo["raised"] = self.amountRised
        fireInfo["poolDescription"] = self.poolDescription
        return fireInfo
    }
}