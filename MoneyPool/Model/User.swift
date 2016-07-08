//
//  File.swift
//  MoneyPool
//
//  Created by Jorge Bastos on 7/6/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import Foundation

struct User: MoneyPoolType, FirebaseConvertible {
    
    var firstName: String
    var lastName: String
    var nickname: String
    var email: String
    let imgUrl: String
    let userID: String
    
   init(info: [String : AnyObject]) {
        self.init(userID: "", info: info)
    }
    
    init(userID: String, info: [String:AnyObject]) {
        self.userID = userID
        self.firstName = info["firstName"] as? String ?? "no name"
        self.lastName = info["lastName"] as? String ?? "no entry"
        self.nickname = info["nickname"] as? String ?? "no entry"
        self.email = info["email"] as! String ?? "no entry"
        if let imgUrl = info["imgUrl"] as? String {
            self.imgUrl = imgUrl
        } else {
            self.imgUrl = "no image"
        }
        
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