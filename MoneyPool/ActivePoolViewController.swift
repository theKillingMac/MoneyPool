//
//  ActivePoolViewController.swift
//  MoneyPool
//
//  Created by Jorge Bastos on 7/7/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit

class ActivePoolViewController: UIViewController {
    
    var pool: Pool?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var paymentSetLabel: UILabel!
    @IBOutlet weak var amountRaisedLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountGoalLabel: UILabel!
    @IBOutlet weak var poolDescriptionLabel: UITextView!
    
    
    @IBAction func payNowTapped(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let pool = pool {
            titleLabel.text = pool.eventName
            poolDescriptionLabel.text = pool.poolDescription
            amountGoalLabel.text = "\(pool.amountGoal)"
            amountRaisedLabel.text = "\(pool.amountRised)"
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - UITableViewDelegate
extension ActivePoolViewController: UITableViewDelegate {
    
}


