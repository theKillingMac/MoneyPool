//
//  CreatePoolViewController.swift
//  
//
//  Created by Edrick Pascual on 7/6/16.
//
//

import UIKit

class CreatePoolViewController: UIViewController {
    
    
    @IBOutlet weak var paymentSelection: UIPickerView!
    
    
    let pickerData = ["daily","weekly","bi-weekly","monthly","bi-monthly", "custom"]

    override func viewDidLoad() {
        super.viewDidLoad()
        

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