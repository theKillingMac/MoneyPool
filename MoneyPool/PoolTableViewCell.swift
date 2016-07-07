//
//  PoolTableViewCell.swift
//  MoneyPool
//
//  Created by Jorge Bastos on 7/6/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit

class PoolTableViewCell: UITableViewCell {
    
    private var pool: Pool? {
        didSet {
            if pool != nil {
                titleLabel.text = pool!.eventName
                toRaiseLabel.text = "\(pool!.amountGoal)"
                raisedLabel.text = "\(pool!.amountRised)"
                leftToRaiseLabel.text = "\(pool!.amountGoal - pool!.amountRised)"
            }
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var toRaiseLabel: UILabel!
    @IBOutlet weak var raisedLabel: UILabel!
    @IBOutlet weak var leftToRaiseLabel: UILabel!
    
    
    func configure(cell: MoneyPoolType) {
        guard let cell = cell as? Pool else { return }
        self.pool = cell
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
