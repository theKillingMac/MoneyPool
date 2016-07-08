//
//  FirebaseHelper.swift
//  MoneyPool
//
//  Created by Jorge Bastos on 7/5/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import Firebase

protocol FirebaseConvertible {
    func converToFirebase() -> [String:AnyObject]
}

enum RefPoint: String {
    case Users = "users"
    case Pools = "pools"
    case Invitations = "invitations"
    case Friends = "friends"
    case PaymentPlan = "paymentPlan"
}

class FirebaseHelper {
    
    private static var _rootRef = FIRDatabase.database().reference()
    
    static var rootRef: FIRDatabaseReference {
        return _rootRef
    }
    
    init() {
    }
    
    // MARK: - Firebase user signup and login
    func loginWithEmail(email: String, andPassword password: String) {
        FIRAuth.auth()?.signInWithEmail(email, password: password, completion: { (user: FIRUser?, error: NSError?) in
            if error != nil {
                ErrorHandling.defaultErrorHandler(error!)
            } else if let user = user {
                print(user)
            }
        })
    }
    
    func createUserWithEmail(email: String, andPassword password: String) {
        FIRAuth.auth()?.createUserWithEmail(email, password: password, completion: { (user: FIRUser?, error: NSError?) in
            if error != nil {
                ErrorHandling.defaultErrorHandler(error!)
            } else if user != nil {
                self.loginWithEmail(email, andPassword: password)
            }
        })
    }
    
    //MARK: - Firebase save data
    func saveData(data: MoneyPoolType, toRefPoint refPoint: RefPoint) {
        
        guard let data = data as? FirebaseConvertible else {
            ErrorHandling.defaultErrorHandler(NSError(domain: "Error", code: 1, userInfo: [NSLocalizedDescriptionKey: "data not compatible with FirebaseConvertible protocol"]))
            return
        }
        
        switch refPoint {
        case .Users:
            saveToUsers(data)
        case .Friends:
            saveToFriends(data)
        case .Pools:
            saveToPools(data)
        case .Invitations:
            saveToInvitaion(data)
        case .PaymentPlan:
            saveToPaymentPlan(data)
        }
    }
    
    private func saveToUsers(data: FirebaseConvertible) {
        FirebaseHelper._rootRef.child(RefPoint.Users.rawValue).childByAutoId().setValue(data.converToFirebase()) { (error: NSError?, dataRef: FIRDatabaseReference) in
            if error != nil {
                ErrorHandling.defaultErrorHandler(error!)
            }
        }
    }
    
    
    private func saveToPools(data: FirebaseConvertible) {
        FirebaseHelper._rootRef.child(RefPoint.Pools.rawValue).childByAutoId().setValue(data.converToFirebase()) { (error: NSError?, dataRef: FIRDatabaseReference) in
            if error != nil {
                ErrorHandling.defaultErrorHandler(error!)
            }
        }
    }
    
    private func saveToInvitaion(data: FirebaseConvertible) {
		print("saving invitation...")
        FirebaseHelper._rootRef.child(RefPoint.Invitations.rawValue).childByAutoId().setValue(data.converToFirebase()) { (error: NSError?, dataRef: FIRDatabaseReference) in
            if error != nil {
                ErrorHandling.defaultErrorHandler(error!)
            }
        }
    }
	
	private func saveToFriends(data: FirebaseConvertible) {
		FirebaseHelper._rootRef.child(RefPoint.Invitations.rawValue).childByAutoId().setValue(data.converToFirebase()) { (error: NSError?, dataRef: FIRDatabaseReference) in
			if error != nil {
				ErrorHandling.defaultErrorHandler(error!)
			}
		}
	}
    
    private func saveToPaymentPlan(data: FirebaseConvertible) {
		print("saving payment plan...")
        FirebaseHelper._rootRef.child(RefPoint.PaymentPlan.rawValue).childByAutoId().setValue(data.converToFirebase()) { (error: NSError?, dataRef: FIRDatabaseReference) in
            if error != nil {
                ErrorHandling.customErrorMessage("error in saving!!")
            }
        }
    }
	
    //MARK: - Firebase observers
    /// add a continous observer for the values
    func addValueObserverForRefPoint(refPoint: RefPoint, completion: (FIRDataSnapshot) -> Void) {
        FirebaseHelper._rootRef.child(refPoint.rawValue).observeEventType(.Value, withBlock: completion)
    }
    
    func addValueObserverForCustomRefPoint(customRefPoint: String, completion: (FIRDataSnapshot) -> Void) {
        FirebaseHelper._rootRef.child(customRefPoint).observeSingleEventOfType(.Value, withBlock: completion)
    }
    
    /// add firebase observer for a single event
    func addSingleObserverForRefPoint(refPoint: RefPoint, completion: (FIRDataSnapshot) -> Void) {
        FirebaseHelper._rootRef.child(refPoint.rawValue).observeSingleEventOfType(.Value, withBlock: completion)
    }
    
    /// Remove firebase observer
    func removeObserverForRefPoint(refPoint: RefPoint) {
        FirebaseHelper._rootRef.child(refPoint.rawValue).removeAllObservers()
    }
}





















