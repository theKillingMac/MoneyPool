//
//  InvitaionTableViewCell.swift
//  MoneyPool
//
//  Created by Jorge Bastos on 7/6/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit

class InvitaionTableViewCell: UITableViewCell {
    
    private var invitaion: Invitation?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var accepted: UILabel!
    @IBOutlet weak var declinedLabel: UILabel!
    @IBOutlet weak var pendingLabel: UILabel!
    @IBOutlet weak var timeLeftLabel: UILabel!
    
    func configure(cell: MoneyPoolType) {
        guard let cell = cell as? Invitation else { return }
        self.invitaion = cell
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
