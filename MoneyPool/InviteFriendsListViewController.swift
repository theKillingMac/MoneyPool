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
		let recurringAmount: Double
		let amountToRaise: Double
		let numberOfPayments: Int
		let paymentsMadeEveryTimePeriod: String
	}
	
	//Information given when segued to this view controller
	var incompleteInvitation: partiallyMadeInvitation = partiallyMadeInvitation(info: "description of pool", title: "title of pool", recurringAmount: 50, amountToRaise: 400, numberOfPayments: 8, paymentsMadeEveryTimePeriod: "weekly")
	
	
	
	var allFriends: [String] = ["-KLzPHdO_rEwJuaxA1nr", "user-123456", "-KM-xqDASUJHTA7yWOYA"] {
		didSet{
			//displayFriends = allFriends
		}
	}
	
//	var displayFriends: [String] = [] {
//		didSet{
//			tableView.reloadData()
//		}
//	}
	
	var allUsersInFirebase = [User]()
	var friendsOfCurrentUser = [User]()
	
	let friendsImages: [UIImage] = []
	var invitedFriends = [String]()
	
	//var firebase = FirebaseHelper()
	let currentUser: String = "-KLzPHdO_rEwJuaxA1nr"
	
	//let dataSource = DataSource(dataSourceType: .InviteFriendListTableViewCell)
	
    override func viewDidLoad() {
        super.viewDidLoad()
		//tableView.dataSource = dataSource
		tableView.delegate = self
		//displayFriends = allFriends
		
//		firebase.addValueObserverForRefPoint(RefPoint.Friends) { (result: FIRDataSnapshot) in
//			let allFriends = result.value as! [String: AnyObject]
//			self.updateTable(allFriends)
//		}
//		
//		firebase.addSingleObserverForRefPoint(RefPoint.Users) { (result: FIRDataSnapshot) in
//			let allUsers = result.value as! [String: AnyObject]
//			for user in allUsers {
//				
//				self.allUsersInFirebase.append(User(info: user as! [String: AnyObject]))
//			}
//		}

        // Do any additional setup after loading the view.
    }

	
//	func updateTable(friendsData: [String: AnyObject]){
//		
//		if let friendsArrayOfCurrentUser = friendsData[currentUser] { //the array contains dictionairies
//			//print(friendsArrayOfCurrentUser)
//			
//			for friendData in friendsArrayOfCurrentUser as! [String: Bool]{
//				//friendData is a tuple of the userID and the boolean value(always true)
//				allFriends.append(friendData.0)
//			}
//
//		}
//		
//	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		//dataSource.addOFirebaseObserverForRefPoint(.Friends)
	}
	
	@IBAction func SendInvitesButtonPushed(sender: UIButton) {
		//make an invitation and save to Firebase
		
		//right now all variables in invitation just listed - NOT DONE the structs for paymentPlan etc
		print("button pushed")
		let invitation = Invitation(title: incompleteInvitation.title,
		                            info: incompleteInvitation.info,
		                            recurringAmount: incompleteInvitation.recurringAmount,
		                            amountToRaise: incompleteInvitation.amountToRaise,
		                            numberOfPayments: incompleteInvitation.numberOfPayments,
		                            paymentsMadeEveryTimePeriod: incompleteInvitation.paymentsMadeEveryTimePeriod,
		                            usersID: allFriends)
		
		let firebase = FirebaseHelper()
		firebase.saveData(invitation, toRefPoint: RefPoint.Invitations)
	}

}

////MARK: Table View
extension InviteFriendsListViewController: UITableViewDelegate{

}
//	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//		return displayFriends.count
//	}
//	
//	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//		let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! InviteFriendListTableViewCell
//		cell.friendNameLabel.text = displayFriends[indexPath.row]
//		//need to set the image of the friend
//		
//		cell.delegate = self
//		return cell
//	}
//	
//	
//}

//MARK: Search Bar
extension InviteFriendsListViewController: UISearchBarDelegate{
	func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
		searchBar.setShowsCancelButton(true, animated: true)
		//displayFriends = allFriends
		//tableView.reloadData()
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
	func cell(cell: InviteFriendListTableViewCell, didInviteFriend invitedFriend: String){
		invitedFriends.append(invitedFriend)
	}
	func cell(cell: InviteFriendListTableViewCell, didUninviteFriend uninvitedFriend: String){
		invitedFriends = invitedFriends.filter(){$0 != uninvitedFriend}
	}

}

//extension InviteFriendsListViewController: DataSourceDelegate{
//	func updateData() {
//		print("I AM UPDATING THE TABLE...")
//		tableView.reloadData()
//	}
//}

