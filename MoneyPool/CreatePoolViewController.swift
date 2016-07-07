//
//  CreatePoolViewController.swift
//  
//
//  Created by Edrick Pascual on 7/6/16.
//
//

import UIKit

class CreatePoolViewController: UIViewController {
    
    private var invitation: Invitation?
    
    @IBOutlet weak var eventNameTextField: UITextField!
    
    @IBOutlet weak var amountGoalTextField: UITextField!
    
    @IBOutlet weak var poolDescriptionTextField: UITextField!
    
    
    @IBOutlet weak var paymentSelection: UIPickerView!
    
    @IBAction func inviteFriendsTapped(sender: AnyObject) {
        
        // Invitation
    }
    
    let pickerData = ["daily","weekly","bi-weekly","monthly","bi-monthly", "custom"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // Prepare for Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
                
        guard let viewController = segue.destinationViewController as? InviteFriendsListViewController else {
            
            // handle the error her
            return
        }
        if segue.identifier == "inviteFriends" {
            if let invitation = invitation {
//                let newInvitation = Pool()
//                newInvitation.eventName = eventNameTextField.text ?? ""
//                newInvItation.amountGoal = Double(amountGoalTextField.text) ?? 0.00
//                newInvitation.poolDescription = poolDescriptionTextField.text ?? ""
                
            } else {
                
//                let invitation = Pool()
//                invitation.eventName = eventNameTextField.text ?? ""
//                invitation.amountGoal = Double(amountGoalTextField.text) ?? 0.00
//                invitation.poolDescription = poolDescriptionTextField.text ?? ""
                
            }
            
        }
    }
    
}


extension CreatePoolViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerData[row]
    }
    
    

}