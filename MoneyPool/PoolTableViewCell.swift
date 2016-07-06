//
//  PoolTableViewCell.swift
//  MoneyPool
//
//  Created by Jorge Bastos on 7/6/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit

class PoolTableViewCell: UITableViewCell {
    
    private var pool: Pool?
    
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
