//
//  InviteFriendListTableViewCell.swift
//  MoneyPool
//
//  Created by Parth Shah on 05/07/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit

class InviteFriendListTableViewCell: UITableViewCell {

	@IBOutlet weak var friendImageView: UIImageView!
	@IBOutlet weak var friendNameLabel: UILabel!
	@IBOutlet weak var inviteFriendButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	@IBAction func inviteFriendButtonPushed(sender: UIButton) {
	}
	
}
