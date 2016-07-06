//
//  CreatePoolViewController.swift
//  
//
//  Created by Edrick Pascual on 7/6/16.
//
//

import UIKit

class CreatePoolViewController: UIViewController {
    
    
    @IBOutlet weak var eventName: UITextField!
    
    @IBOutlet weak var amountGoal: UITextField!
    
    
    
    @IBOutlet weak var paymentSelection: UIPickerView!
    
    @IBAction func inviteFriendsTapped(sender: AnyObject) {
    }
    
    let pickerData = ["daily","weekly","bi-weekly","monthly","bi-monthly", "custom"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // Segue to invite friends
    // Prepare for Segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            
            if identifier == "inviteFriends" {
                print("Invite Cell Tapped")
                
                let displayInviteViewController = segue.destinationViewController as! InviteFriendsListViewController
            
                
                
//                //MARK: Determining the selected note
//                //1
//                let indexPath = tableView.indexPathForSelectedRow!
//                //2 Identifying each cell with the indexpath to retrieve the note from notes array.
//                let note = notes[indexPath.row]
//                print(notes)
          
            } else {
                print("error")
                
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