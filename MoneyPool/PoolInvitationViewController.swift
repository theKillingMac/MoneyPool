//
//  PoolInvitationViewController.swift
//  MoneyPool
//
//  Created by Parth Shah on 06/07/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit

class PoolInvitationViewController: UIViewController {

	@IBOutlet weak var poolInfo: UITextView!
	@IBOutlet weak var amountToRaise: UILabel!
	@IBOutlet weak var numberOfPayments: UILabel!
	@IBOutlet weak var recurringAmount: UILabel!
	@IBOutlet weak var paymentsMadeEveryTimePeriod: UILabel!
	
	var poolTitle: String = "" {
		didSet{
			navigationItem.title = poolTitle
		}
		
	}
	
	var usersID: [String] = ["user-123456"]{
		didSet{
			//will need to update the users array
			tableView.reloadData()
		}
	}
	
	//var usersOfPool = [User]()
	
	let currentUser:String = "user-123456"
	
	//The invitation should be set during the segue to this controller
	var invitation: Invitation!{
		didSet{
			poolTitle = invitation.title
			poolInfo.text = invitation.info
			amountToRaise.text = "\(invitation.amountToRaise)"
			numberOfPayments.text = "\(invitation.numberOfPayments)"
			recurringAmount.text = "\(invitation.recurringAmount)"
			paymentsMadeEveryTimePeriod.text = "\(invitation.paymentsMadeEveryTimePeriod)"
			usersID = invitation.usersID
		}
	}
	
	@IBOutlet weak var tableView: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	
	
	//MARK Accept/Decline Button
	@IBAction func acceptOrDeclineButtonPushed(sender: UIButton) {
		//find current user in the invitation on firebase
		//or can u change the local invitation copy and save?!?
		//change its status to...
		
		if sender.titleLabel?.text == "ACCEPT"{
			//status = accept
			
			
		} else if sender.titleLabel?.text == "DECLINE"{
			//status = decline
			
		}
		
		//segue home
	}
	

}


//MARK: Table View
extension PoolInvitationViewController: UITableViewDataSource, UITableViewDelegate{
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return usersID.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! PoolInvitationFriendListsTableViewCell
		cell.friendNameLabel.text = usersID[indexPath.row] //actually be from the usersOfPool array
		//all data will need to be set from usersOfPool array
		cell.statusInPool.text = "Pending" //this is only temporary as stated above...
		
		return cell
	}
}

