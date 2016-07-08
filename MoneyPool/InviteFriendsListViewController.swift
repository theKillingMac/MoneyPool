//
//  InviteFriendsListViewController.swift
//  MoneyPool
//
//  Created by Parth Shah on 05/07/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit
import Firebase

class InviteFriendsListViewController: UIViewController {

	@IBOutlet weak var searchBar: UISearchBar!
	@IBOutlet weak var tableView: UITableView!
	
	//Contains everything except the invities
	struct partiallyMadeInvitation {
		let info: String
		let title: String
		let amountToPay: Double
		let amountToRaise: Double
		let numberOfPayments: Int
		let periodOfPayments: String
	}
	
	//Information given when segued to this view controller
	var incompleteInvitation: partiallyMadeInvitation = partiallyMadeInvitation(info: "description of pool", title: "title of pool", amountToPay: 50, amountToRaise: 400, numberOfPayments: 8, periodOfPayments: "weekly")
	
	
	
	var invitedFriends = [String: AnyObject]()
	
	var friendsArrayBackup = [MoneyPoolType]() //needed for search
	
	
	
	//var firebase = FirebaseHelper()
	let currentUser: String = "-KLzPHdO_rEwJuaxA1nr"
	
	
	
	
	
	let dataSource = DataSource(dataSourceType: DataSourceType.InviteFriendListTableViewCell)
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self
		tableView.dataSource = dataSource
		tableView.delegate = self
		dataSource.delegate = self
		dataSource.viewController = self
		
		
        // Do any additional setup after loading the view.
    }
	
	
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		dataSource.addOFirebaseObserverForRefPoint(.Friends)
	}
	
	
	
	
	
	@IBAction func SendInvitesButtonPushed(sender: UIButton) {
		print("button pushed")
		
		let paymentPlan = PaymentPlan(amountToPay: incompleteInvitation.amountToPay,
		                              numberOfPayments: incompleteInvitation.numberOfPayments,
		                              periodOfPayments: incompleteInvitation.periodOfPayments)
		let paymentPlanID = "paymentPlanID1"
		
		dataSource.saveToDatabase(paymentPlan)
		
		let invitation = Invitation(title: incompleteInvitation.title,
		                            info: incompleteInvitation.info,
		                            amountToRaise: incompleteInvitation.amountToRaise,
		                            paymentPlanID: paymentPlanID,
		                            usersID: invitedFriends)
		
		dataSource.saveToDatabase(invitation)
		
	}

}

////MARK: Table View
extension InviteFriendsListViewController: UITableViewDelegate{
	
}



extension InviteFriendsListViewController: DataSourceDelegate {
	func updateData() {
		//print("I AM UPDATING THE TABLE...")
		tableView.reloadData()
	}
}


//MARK: Search Bar
extension InviteFriendsListViewController: UISearchBarDelegate{
	func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
		searchBar.setShowsCancelButton(true, animated: true)
		dataSource.moneyPoolData = []
		updateData()
	}
	
	func searchBarCancelButtonClicked(searchBar: UISearchBar) {
		searchBar.resignFirstResponder()
		searchBar.text = ""
		searchBar.setShowsCancelButton(false, animated: true)
		dataSource.moneyPoolData = friendsArrayBackup
		updateData()
	}
	
	func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
		//dataSource.moneyPoolData = allFriends.filter(){$0.lowercaseString.containsString(searchText.lowercaseString)}
		dataSource.moneyPoolData = []
		for index in 0..<friendsArrayBackup.count {
			let user = friendsArrayBackup[index] as! User
			let presentInData = user.nickname.lowercaseString.containsString(searchText.lowercaseString)
			if presentInData {
				dataSource.moneyPoolData.append(friendsArrayBackup[index])
			}
		}
		updateData()
	}
	
	func searchBarSearchButtonClicked(searchBar: UISearchBar) {
		self.view.endEditing(true)
		searchBar.setShowsCancelButton(true, animated: true)
		tableView.reloadData()
	}
	
}

//MARK: Friend invitation
extension InviteFriendsListViewController: InviteFriendTableViewCellDelegate {
	func cell(cell: InviteFriendListTableViewCell, didInviteFriend invited: Bool){
	
		//GET THE USER AND STROE IT IN INVITED FRIENDS
		//invitedFriends.append(invitedFriend)
		print(cell)
		let path = tableView.indexPathForCell(cell)
		let row = path?.row
		
		
		let user = dataSource.moneyPoolData[row!] as! User
		
		print("invite user...")
		
		if invited{
			self.invitedFriends[user.userID] = true
		}else{
			self.invitedFriends.removeValueForKey(user.userID)
		}
		
	}
	
	

}

