//
//  InviteFriendListTableViewCell.swift
//  MoneyPool
//
//  Created by Parth Shah on 05/07/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit

//protocol InviteFriendTableViewCellDelegate {
//	func cell(cell: InviteFriendListTableViewCell, didInviteFriend invited: Bool)
//}

class InviteFriendListTableViewCell: UITableViewCell {

	private var user: User? {
		didSet{
			if let user = user{
				inviteStateLabel.text = "INVITE"
				friendUsernameLabel.text = user.nickname
				friendNameLabel.text = (user.firstName) + " " + (user.lastName)
				friendImageView?.image = UIImage(data: (NSURL(string: user.imgUrl)?.dataRepresentation)!)
			}
			
		}
	}
	
	@IBOutlet weak var friendImageView: UIImageView!
	@IBOutlet weak var friendNameLabel: UILabel!
	@IBOutlet weak var friendUsernameLabel: UILabel!
	@IBOutlet weak var inviteStateLabel: UILabel!
	
	
	func configure(cell: MoneyPoolType){
		guard let cell = cell as? User else {return}
		self.user = cell
	}
	
	var invited = false
	//var delegate: InviteFriendTableViewCellDelegate?

	
	
//	
//	@IBAction func inviteFriendButtonPushed(sender: UIButton) {
//
//	NSNotificationCenter.defaultCenter().postNotificationName("ButtonHasBeenPressed", object: nil)
//		
//
//		
//		sender.selected = !sender.selected
//		print("pushed button")
//		if !invited{
//			//delegate!.cell(self, didInviteFriend: true)
//			invited = true
//		}else{
//			//delegate!.cell(self, didInviteFriend: false)
//			invited = false
//		}
//	}
	
}
