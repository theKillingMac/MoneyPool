//
//  Invitation.swift
//  MoneyPool
//
//  Created by Jorge Bastos on 7/5/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import Foundation

struct Invitation: MoneyPoolType {
	
	let info: String
	let title: String
	let recurringAmount: Double
	let amountToRaise: Double
	let numberOfPayments: Int
	let paymentsMadeEveryTimePeriod: String
	
	let usersID: [String]
	
	
    init(info: [String : AnyObject]) {
        // TODO: implement
        self.info = info["description"] as! String
        self.title = info["title"] as! String
        self.recurringAmount = info["recurringAmount"] as! Double
        self.amountToRaise = info["amountToRaise"] as! Double
        self.numberOfPayments = info["numberOfPayments"] as! Int
        self.paymentsMadeEveryTimePeriod = info["paymentPlan"] as! String
        self.usersID = [String]()
    }
	
	init(
	title: String,
	info: String,
	recurringAmount: Double,
	amountToRaise: Double,
	numberOfPayments: Int,
	paymentsMadeEveryTimePeriod: String,
	usersID: [String] ){
		
		self.info = info
		self.title = title
		self.recurringAmount = recurringAmount
		self.amountToRaise = amountToRaise
		self.numberOfPayments = numberOfPayments
		self.paymentsMadeEveryTimePeriod = paymentsMadeEveryTimePeriod
		self.usersID = usersID
		
	}
    
    func converToFirebase() -> [String:AnyObject] {
        return [String:AnyObject]()
    }
}
