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
    let numberOfPayments: Int
    let periodOfPayments: String 
    
    init(info: [String : AnyObject]) {
        // TODO: implement
        self.amountToPay = info["amountToPay"] as! Double
        self.numberOfPayments = info["numberOfPayments"] as! Int
        self.periodOfPayments = info["periodic"] as! String
    }
    
    func converToFirebase() -> [String:AnyObject] {
        var paymentInfo = [String:AnyObject]()
        paymentInfo["amountToPay"] = self.amountToPay
        paymentInfo["numberOfPayments"] = self.numberOfPayments
        paymentInfo["periodic"] = self.periodOfPayments
        return paymentInfo
    }
	
	init(amountToPay: Double, numberOfPayments: Int, periodOfPayments: String){
		self.amountToPay = amountToPay
		self.numberOfPayments = numberOfPayments
		self.periodOfPayments = periodOfPayments
	}
	
}