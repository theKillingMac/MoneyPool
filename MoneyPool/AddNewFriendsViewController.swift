//
//  addNewFriendsViewController.swift
//  MoneyPool
//
//  Created by Parth Shah on 07/07/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit
import Firebase

class AddNewFriendsViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var searchBar: UISearchBar!
	
	var displayUsers = [User]()
	let currentUser = FIRAuth.auth()?.currentUser!
	let dataSource = DataSource(dataSourceType: DataSourceType.AddNewFriendsTableViewCell)
	
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.dataSource = dataSource
		tableView.delegate = self
		dataSource.delegate = self

        // Do any additional setup after loading the view
    }

	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		dataSource.addOFirebaseObserverForRefPoint(RefPoint.Users)
	}
	
	@IBAction func closeButtonPressed(sender: UIButton) {
		dismissViewControllerAnimated(true, completion: nil)
	}
	
}

extension AddNewFriendsViewController: UISearchBarDelegate{
	func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
		searchBar.showsCancelButton = true
	}
	
	func searchBarCancelButtonClicked(searchBar: UISearchBar) {
		searchBar.text = ""
		searchBar.showsCancelButton = false
		searchBar.resignFirstResponder()
	}
	
	func searchBarSearchButtonClicked(searchBar: UISearchBar) {
		self.view.endEditing(true)
		searchBar.showsCancelButton = true
	}
	
	func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
		print("made a change to the text")
	}
	
	
}

extension AddNewFriendsViewController: DataSourceDelegate{
	func updateData() {
		tableView.reloadData()
	}
}

extension AddNewFriendsViewController: UITableViewDelegate{
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		print("GOT IT!!")
		let cell = tableView.cellForRowAtIndexPath(indexPath) as! AddNewFriendsTableViewCell
		let user = dataSource.moneyPoolData[indexPath.row] as! User
		
		if cell.addOrRemoveFriendLabel.text == "Add Friend" {
			cell.addOrRemoveFriendLabel.text = "Remove Friend"
			FirebaseHelper.rootRef.child("friends/\(currentUser!.uid)").setValue(["\(user.userID)": true])

		}else{
			cell.addOrRemoveFriendLabel.text = "Add Friend"
		}
	}
}
