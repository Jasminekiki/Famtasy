//
//  LoginFormViewController.swift
//  KGFloatingDrawer-Example
//
//  Created by Pisces on 16/3/2.
//  Copyright © 2016年 Kyle Goddard. All rights reserved.
//

import Foundation
import UIKit

class loginFormViewController: UIViewController{
   
    @IBOutlet weak var EmailTextField: UITextField!
    
   
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBAction func CloseKeyBoard(sender: AnyObject) {
        EmailTextField.resignFirstResponder()
        PasswordTextField.resignFirstResponder()
    }
   
    
    @IBAction func DoneCloseKeyBoard(sender: AnyObject) {
        EmailTextField.resignFirstResponder()
        PasswordTextField.resignFirstResponder()
    }
   


 override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
    EmailTextField.resignFirstResponder()
    PasswordTextField.resignFirstResponder()
}

}