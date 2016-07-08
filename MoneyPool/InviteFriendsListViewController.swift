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
	
	
	
	var allUsersInFirebase = [User]()
	var friendsOfCurrentUser = [User]()
	
	let friendsImages: [UIImage] = []
	var invitedFriends = [String: AnyObject]()
	
	
	
	
	
	//var firebase = FirebaseHelper()
	let currentUser: String = "-KLzPHdO_rEwJuaxA1nr"
	
	
	
	
	
	let dataSource = DataSource(dataSourceType: DataSourceType.InviteFriendListTableViewCell)
	
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.dataSource = dataSource
		tableView.delegate = self
		dataSource.delegate = self
		
		
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
		                            usersID: ["USERID1": true])
		
		dataSource.saveToDatabase(invitation)
	}

}

////MARK: Table View
extension InviteFriendsListViewController: UITableViewDelegate{

}



extension InviteFriendsListViewController: DataSourceDelegate {
	func updateData() {
		print("I AM UPDATING THE TABLE...")
		tableView.reloadData()
	}
}


//MARK: Search Bar
extension InviteFriendsListViewController: UISearchBarDelegate{
	func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
		searchBar.setShowsCancelButton(true, animated: true)
		//displayFriends = allFriends
	}
	
	func searchBarCancelButtonClicked(searchBar: UISearchBar) {
		searchBar.resignFirstResponder()
		searchBar.text = ""
		searchBar.setShowsCancelButton(false, animated: true)
		//displayFriends = allFriends
	}
	
	func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
		//displayFriends = allFriends.filter(){$0.lowercaseString.containsString(searchText.lowercaseString)}
	}
	
	func searchBarSearchButtonClicked(searchBar: UISearchBar) {
		self.view.endEditing(true)
		searchBar.showsCancelButton = true
	}
	
}

//MARK: Friend invitation
extension InviteFriendsListViewController: InviteFriendTableViewCellDelegate{
	func cell(cell: InviteFriendListTableViewCell, didInviteFriend invitedFriendName: String){
		
		//GET THE USER AND STROE IT IN INVITED FRIENDS
		//invitedFriends.append(invitedFriend)
	}
	func cell(cell: InviteFriendListTableViewCell, didUninviteFriend uninvitedFriendName: String){
		
		//GET THE USER AND REMOVE IT FROM INVITED FRIENDS
		//invitedFriends = invitedFriends.filter(){$0 != uninvitedFriend}
	}

}

