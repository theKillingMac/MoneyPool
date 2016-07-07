//
//  addNewFriendsViewController.swift
//  MoneyPool
//
//  Created by Parth Shah on 07/07/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit

class addNewFriendsViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var searchBar: UISearchBar!
	
	var displayUsers = [User]()
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	@IBAction func closeButtonPressed(sender: UIButton) {
		dismissViewControllerAnimated(true, completion: nil)
	}
	
}

extension addNewFriendsViewController: UISearchBarDelegate{
	func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
		searchBar.showsCancelButton = true
	}
	
	func searchBarCancelButtonClicked(searchBar: UISearchBar) {
		searchBar.text = ""
		searchBar.showsCancelButton = false
		searchBar.resignFirstResponder()
	}
	
	func searchBarSearchButtonClicked(searchBar: UISearchBar) {
		print("pressed search")
		self.view.endEditing(true)
		searchBar.showsCancelButton = true
	}
	
	func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
		print("made a change to the text")
	}
	
	
}
