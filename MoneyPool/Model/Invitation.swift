//
//  Invitation.swift
//  MoneyPool
//
//  Created by Jorge Bastos on 7/5/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import Foundation

struct Invitation { //: MoneyPoolType {
	
	let info: String
	let title: String
	let recurringAmount: Int
	let amountToRaise: Int
	let numberOfPayments: Int
	let paymentsMadeEveryTimePeriod: String
	
	let usersID: [String]
	
	
//    init(info: [String : AnyObject]) {
//        // TODO: implement
//    }
	
	init(
	title: String,
	info: String,
	recurringAmount: Int,
	amountToRaise: Int,
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
