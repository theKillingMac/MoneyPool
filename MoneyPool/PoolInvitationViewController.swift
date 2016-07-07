//
//  PoolInvitationViewController.swift
//  MoneyPool
//
//  Created by Parth Shah on 06/07/16.
//  Copyright © 2016 Jorge Bastos. All rights reserved.
//

import UIKit

class PoolInvitationViewController: UIViewController {

	@IBOutlet weak var poolInfo: UITextView!
	@IBOutlet weak var amountToRaise: UILabel!
	@IBOutlet weak var numberOfPayments: UILabel!
	@IBOutlet weak var recurringAmount: UILabel!
	@IBOutlet weak var paymentsMadeEveryTimePeriod: UILabel!
	
	var poolTitle: String = "" {
		didSet{
			navigationItem.title = poolTitle
		}
		
	}
	
	let currentUser:String = "user-123456"
	
	//The invitation should be set during the segue to this controller
	var invitation: Invitation!{
		didSet{
			
		}
	}
	
	@IBOutlet weak var tableView: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	
	@IBAction func acceptOrDeclineButtonPushed(sender: UIButton) {
		if sender.titleLabel?.text == "ACCEPT"{
			
			
			
		} else if sender.titleLabel?.text == "DECLINE"{
			
			
		}
		
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
