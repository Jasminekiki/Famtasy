//
//  EditSchedule.swift
//  Famtasy
//
//  Created by Pisces on 16/3/23.
//  Copyright © 2016年 TAC. All rights reserved.
//

import Foundation
import UIKit

class editScheduleViewController: UIViewController {
    
    
    @IBOutlet weak var EventTextField: UITextField!
    
    
    @IBOutlet weak var LocationTextField: UITextField!
    
    @IBAction func CloseKeyBoard(sender: AnyObject) {
        
        EventTextField.resignFirstResponder()
        LocationTextField.resignFirstResponder()
    }
    
    @IBAction func DoneCloseKeyBoard(sender: AnyObject) {
        EventTextField.resignFirstResponder()
        LocationTextField.resignFirstResponder()
    }
    
    
    
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        EventTextField.resignFirstResponder()
        LocationTextField.resignFirstResponder()
    }
}