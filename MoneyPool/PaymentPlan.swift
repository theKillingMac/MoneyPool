//
//  PaymentPlan.swift
//  MoneyPool
//
//  Created by Edrick Pascual on 7/6/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import Foundation

struct PaymentPlan: MoneyPoolType, FirebaseConvertible {
    
    let amountToPay: Double
    let numberOfPayments: Float
    let periodOfPayments: String 
    
    init(info: [String : AnyObject]) {
        // TODO: implement
    }
    
    func converToFirebase() -> [String:AnyObject] {
        return [String:AnyObject]()
    }
    
}