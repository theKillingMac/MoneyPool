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

	private var user: User? {
		didSet{
			if let user = user{
				friendNameLabel.text = (user.firstName) + " " + (user.lastName)
				friendImageView.image = UIImage(data: (NSURL(string: user.imgUrl)?.dataRepresentation)!)
			}
			
		}
	}
	
	@IBOutlet weak var friendImageView: UIImageView!
	@IBOutlet weak var friendNameLabel: UILabel!
	@IBOutlet weak var inviteFriendButton: UIButton!
	
	
	func configure(cell: MoneyPoolType){
		guard let cell = cell as? User else {return}
		print("configuring cell...")
		self.user = cell
	}
	
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
