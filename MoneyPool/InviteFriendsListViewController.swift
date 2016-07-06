//
//  InviteFriendsListViewController.swift
//  MoneyPool
//
//  Created by Parth Shah on 05/07/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit

class InviteFriendsListViewController: UIViewController {

	@IBOutlet weak var searchBar: UISearchBar!
	@IBOutlet weak var tableView: UITableView!
	
	let allFriends: [String] = ["John", "Tom", "Harry"]
	var displayFriends: [String] = []
	let friendsImages: [UIImage] = []
	var invitedFriends = [String]()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
		displayFriends = allFriends
		
        // Do any additional setup after loading the view.
    }

	@IBAction func SendInvitesButtonPushed(sender: UIButton) {
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
		tableView.reloadData()
	}
	
	func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
		print(searchText)
		displayFriends = allFriends.filter(){$0.lowercaseString.containsString(searchText.lowercaseString)}
		print(displayFriends)
		tableView.reloadData()
	}
	
}

//MARK: Friend invitation
extension InviteFriendsListViewController: InviteFriendTableViewCellDelegate{
	func cell(cell: InviteFriendListTableViewCell, didInviteFriend invitedFriend: String){
		invitedFriends.append(invitedFriend)
		print(invitedFriends)
	}
	func cell(cell: InviteFriendListTableViewCell, didUninviteFriend uninvitedFriend: String){
		invitedFriends = invitedFriends.filter(){$0 != uninvitedFriend}
		print(invitedFriends)
	}

}

