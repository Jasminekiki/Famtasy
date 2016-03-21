//
//  CreateFamilyViewController.swift
//  KGFloatingDrawer-Example
//
//  Created by Pisces on 16/3/2.
//  Copyright © 2016年 Kyle Goddard. All rights reserved.
//

import Foundation
import UIKit

class createFamilyViewController: UIViewController{
    @IBAction func toggleLeftDrawer(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.toggleLeftDrawer(sender, animated: false)
    }
    
    
    @IBOutlet weak var FamilyNameTextField: UITextField!
    
    
    @IBOutlet weak var FamilyMemberTextField: UITextField!
    
    @IBAction func CloseKeyBoard(sender: AnyObject) {
        FamilyNameTextField.resignFirstResponder()
        FamilyMemberTextField.resignFirstResponder()
    }
    
    @IBAction func DoneCloseKeyBoard(sender: AnyObject) {
        FamilyNameTextField.resignFirstResponder()
        FamilyMemberTextField.resignFirstResponder()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        FamilyNameTextField.resignFirstResponder()
        FamilyMemberTextField.resignFirstResponder()
    }
}