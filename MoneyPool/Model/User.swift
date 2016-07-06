//
//  File.swift
//  MoneyPool
//
//  Created by Jorge Bastos on 7/6/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import Foundation

struct User: MoneyPoolType, FirebaseConvertible {
    
    let firstName: String
    let lastName: String
    let nickname: String
    let email: String
    let imgUrl: String
    
    init(info: [String : AnyObject]) {
        self.firstName = info["firstName"] as! String
        self.lastName = info["lastName"] as! String
        self.nickname = info["nickname"] as! String
        self.email = info["email"] as! String
        self.imgUrl = info["imgUrl"] as! String
    }
    
    func converToFirebase() -> [String:AnyObject] {
        var fireInfo = [String:AnyObject]()
        fireInfo["firstName"] = self.firstName
        fireInfo["lastName"] = self.lastName
        fireInfo["nickname"] = self.nickname
        fireInfo["email"] = self.email
        fireInfo["imgUrl"] = self.imgUrl
        return fireInfo
    }
}