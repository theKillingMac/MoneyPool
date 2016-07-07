//
//  ActivePoolViewController.swift
//  MoneyPool
//
//  Created by Edrick Pascual on 7/6/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit

class ActivePoolViewController: UIViewController {
    
    var pool: Pool?
    
    @IBOutlet weak var eventNameLabel: UILabel!
    
    @IBOutlet weak var poolDescriptionLabel: UITextView!
    
    @IBOutlet weak var paymentSelectionLabel: UILabel!
    
    @IBOutlet weak var amountGoalLabel: UILabel!
    
    @IBOutlet weak var amountRaisedLabel: UILabel!
    
    @IBAction func payTappedButton(sender: AnyObject) {
    }


    @IBOutlet weak var infoLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   }
