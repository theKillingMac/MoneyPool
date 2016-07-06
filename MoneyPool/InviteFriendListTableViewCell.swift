//
//  InviteFriendListTableViewCell.swift
//  MoneyPool
//
//  Created by Parth Shah on 05/07/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit

protocol InviteFriendTableViewCellDelegate: class{
	func cell(cell: InviteFriendListTableViewCell, didInviteFriend invitedFriend: String)
	func cell(cell: InviteFriendListTableViewCell, didUninviteFriend uninvitedFriend: String)
}

class InviteFriendListTableViewCell: UITableViewCell {

	
	@IBOutlet weak var friendImageView: UIImageView!
	@IBOutlet weak var friendNameLabel: UILabel!
	@IBOutlet weak var inviteFriendButton: UIButton!
	
	var invited = false
	weak var delegate: InviteFriendTableViewCellDelegate?

	@IBAction func inviteFriendButtonPushed(sender: UIButton) {
		sender.selected = !sender.selected
		
		if !invited{
			delegate?.cell(self, didInviteFriend: self.friendNameLabel.text!)
			invited = true
		}else{
			delegate?.cell(self, didUninviteFriend: self.friendNameLabel.text!)
			invited = false
		}
	}
	
}
