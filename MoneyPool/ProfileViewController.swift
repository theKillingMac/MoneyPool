//
//  ProfileViewController.swift
//  MoneyPool
//
//  Created by Parth Shah on 08/07/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit
import Firebase


class ProfileViewController: UIViewController {

	var currentUser: User?
	let firebase = FirebaseHelper()
	var userKey: String!
	
	@IBOutlet weak var firstNameTextField: UITextField!
	@IBOutlet weak var lastNameTextField: UITextField!
	@IBOutlet weak var nicknameTextField: UITextField!
	@IBOutlet weak var emailIDTextField: UITextField!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		let user = (FIRAuth.auth()?.currentUser)
		emailIDTextField.text = user?.email
		
		userKey = user?.uid
		print("userKEY: \(userKey)")
		intiallyUpdateData(userKey)
		
		

	}
	
	
	
	func intiallyUpdateData(key: String){
		firebase.addSingleObserverForRefPoint(RefPoint.Users) { (snapShot: FIRDataSnapshot) in
			guard let snaps = snapShot.value as? [String:AnyObject] else {
				ErrorHandling.customErrorMessage("Error fetching data from firebase")
				return }
			
			
			if let userData = snaps[key]{
				let user = User(info: userData as! [String: AnyObject])
				self.currentUser = user
				self.firstNameTextField.text = user.firstName
				self.lastNameTextField.text = user.lastName
				self.nicknameTextField.text = user.nickname
				
			}else{
				print("USER NOT FOUND!!")
//				self.firstNameTextField.text = "No Name"
//				self.lastNameTextField.text = "No Name"
//				self.nicknameTextField.text = "No Name"
				ErrorHandling.customErrorMessage("User not found!. Log in again")
			}
			
			
		}
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func closeButtonPressed(sender: UIButton) {
		self.dismissViewControllerAnimated(true, completion: nil)
	}

	@IBAction func saveChangesButtonPressed(sender: UIButton) {
		self.currentUser?.firstName = self.firstNameTextField.text!
		self.currentUser?.lastName = self.lastNameTextField.text!
		self.currentUser?.nickname = self.nicknameTextField.text!
		self.currentUser?.email = self.emailIDTextField.text!
		
		FirebaseHelper.rootRef.child("users/\(userKey)").setValue(currentUser!.converToFirebase())

		self.dismissViewControllerAnimated(true, completion: nil)
	}
	
	
	@IBOutlet weak var logOutButtonPressed: UIButton!
	
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
