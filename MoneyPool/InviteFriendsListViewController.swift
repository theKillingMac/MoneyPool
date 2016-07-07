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
		let recurringAmount: Int
		let amountToRaise: Int
		let numberOfPayments: Int
		let paymentsMadeEveryTimePeriod: String
	}
	
	//Information given when segued to this view controller
	var incompleteInvitation: partiallyMadeInvitation!
	
	var allFriends: [String] = [] {
		didSet{
			displayFriends = allFriends
		}
	}
	
	var displayFriends: [String] = [] {
		didSet{
			tableView.reloadData()
		}
	}
	
	let friendsImages: [UIImage] = []
	var invitedFriends = [String]()
	
	var firebase = FirebaseHelper()
	let currentUser: String = "-KLzPHdO_rEwJuaxA1nr"
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
		displayFriends = allFriends
		
		firebase.addValueObserverForRefPoint(RefPoint.Friends) { (result: FIRDataSnapshot) in
			self.updateTable(result)
		}
		
        // Do any additional setup after loading the view.
    }

	
	func updateTable(data: FIRDataSnapshot){
		let newData = data.value as! [String: AnyObject]
		
		if let friendsArrayOfCurrentUser = newData[currentUser] { //the array contains dictionairies
			//print(friendsArrayOfCurrentUser)
			
			for friendData in friendsArrayOfCurrentUser as! [String: Bool]{
				//friendData is a tuple of the userID and the boolean value(always true)
				allFriends.append(friendData.0)
			}
		}
		
	}
	
	
	
	@IBAction func SendInvitesButtonPushed(sender: UIButton) {
		//make an invitation and save to Firebase
	}

}

//MARK: Table View
extension InviteFriendsListViewController: UITableViewDataSource, UITableViewDelegate{
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return displayFriends.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! InviteFriendListTableViewCell
		cell.friendNameLabel.text = displayFriends[indexPath.row]
		//need to set the image of the friend
		
		cell.delegate = self
		return cell
	}
	
	
}

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
		displayFriends = allFriends
	}
	
	func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
		displayFriends = allFriends.filter(){$0.lowercaseString.containsString(searchText.lowercaseString)}
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

