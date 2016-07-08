//
//  addNewFriendsTableViewCell.swift
//  MoneyPool
//
//  Created by Parth Shah on 07/07/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit

class addNewFriendsTableViewCell: UITableViewCell {

	var user: User? {
		didSet {
			if let user = user {
				friendNameLabel.text = user.firstName + " " + user.lastName
				friendImageView.image = UIImage(data: (NSURL(string: user.imgUrl)?.dataRepresentation)!)
			}
			
		}
	}
	
	
	@IBOutlet weak var friendImageView: UIImageView!
	@IBOutlet weak var friendNameLabel: UILabel!
	@IBOutlet weak var addRemoveFriendButton: UIButton!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	

	func configure(cell: MoneyPoolType){
		guard let cell = cell as? User else {return}
		self.user = cell
	}

	
	
	@IBAction func addRemoveFriendButtonPushed(sender: UIButton) {
		switch sender.titleLabel!.text! {
		case "Add Friend":
			sender.titleLabel?.text = "Remove Friend"
		case "Remove Friend":
			sender.titleLabel?.text = "Add Friend"
		default: break
		}
	}


}
