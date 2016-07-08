//
//  ContributorsTableViewCell.swift
//  MoneyPool
//
//  Created by Jorge Bastos on 7/7/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit

class ContributorsTableViewCell: UITableViewCell {
    
    var user: User? {
        didSet {
            if let user = user {
                friendNameLabel.text = "\(user.firstName) \(user.lastName)"
                friendImageView.image = UIImage(data: (NSURL(string: user.imgUrl)?.dataRepresentation)!)
            }
        }
    }
    
    
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var friendNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configure(cell: MoneyPoolType){
        guard let cell = cell as? User else {return}
        self.user = cell
    }
}
