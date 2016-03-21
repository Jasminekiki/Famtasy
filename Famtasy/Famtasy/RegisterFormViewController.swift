//
//  RegisterFormViewController.swift
//  KGFloatingDrawer-Example
//
//  Created by Pisces on 16/3/2.
//  Copyright © 2016年 Kyle Goddard. All rights reserved.
//

import Foundation
import UIKit

class registerFormViewController: UIViewController{
    
    @IBOutlet weak var FullNameTextField: UITextField!
    
    @IBOutlet weak var UserNameTextField: UITextField!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PassTextField: UITextField!
    
    @IBOutlet weak var ConfirmPassField: UITextField!
    
    
    @IBAction func CloseKeyBoard(sender: AnyObject) {
        FullNameTextField.resignFirstResponder()
        UserNameTextField.resignFirstResponder()
        EmailTextField.resignFirstResponder()
        PassTextField.resignFirstResponder()
        ConfirmPassField.resignFirstResponder()
    }
    
     override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        FullNameTextField.resignFirstResponder()
        UserNameTextField.resignFirstResponder()
        EmailTextField.resignFirstResponder()
        PassTextField.resignFirstResponder()
        ConfirmPassField.resignFirstResponder()
    }
    
    
    @IBAction func DoneCloseKeyBoard(sender: AnyObject) {
        FullNameTextField.resignFirstResponder()
        UserNameTextField.resignFirstResponder()
        EmailTextField.resignFirstResponder()
        PassTextField.resignFirstResponder()
        ConfirmPassField.resignFirstResponder()
        
    }
    
    
    
    
    
    
}