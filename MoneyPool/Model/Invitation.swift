//
//  Invitation.swift
//  MoneyPool
//
//  Created by Jorge Bastos on 7/5/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import Foundation

struct Invitation: MoneyPoolType, FirebaseConvertible {
	
	let info: String
	let title: String
	let amountToRaise: Double
	let paymentPlanID: String
	let usersID: [String]
	
	
    init(info: [String : AnyObject]) {
        // TODO: implement
        self.info = info["description"] as! String
        self.title = info["title"] as! String
        self.amountToRaise = info["amountToRaise"] as! Double
		self.paymentPlanID = info["paymentPlanID"] as! String
		
		self.usersID = [String]()
		
    }
	
	init(
	title: String,
	info: String,
	amountToRaise: Double,
	paymentPlanID: String
	usersID: [String] ){
		
		self.info = info
		self.title = title
		self.amountToRaise = amountToRaise
		self.paymentPlanID = paymentPlanID
		self.usersID = usersID
		
	}
    
    func converToFirebase() -> [String:AnyObject] {
        return [String:AnyObject]()
    }
}
