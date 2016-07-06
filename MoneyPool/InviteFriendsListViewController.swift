//
//  InviteFriendsListViewController.swift
//  MoneyPool
//
//  Created by Parth Shah on 05/07/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit

class InviteFriendsListViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	let friends: [String] = ["John", "Tom", "Harry"]
	let friendsImages: [UIImage] = []
	let invitedFriends = [String]()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}

extension InviteFriendsListViewController: UITableViewDataSource, UITableViewDelegate{
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return friends.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! InviteFriendListTableViewCell
		cell.friendNameLabel.text = friends[indexPath.row]
		//need to set the image of the friend
		return cell
	}
	
	
}
