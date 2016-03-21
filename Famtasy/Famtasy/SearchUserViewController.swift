//
//  SearchUserViewController.swift
//  KGFloatingDrawer-Example
//
//  Created by Pisces on 16/3/3.
//  Copyright © 2016年 Kyle Goddard. All rights reserved.
//

import Foundation
import UIKit

class searchViewController: UIViewController{
    
    @IBOutlet weak var SearchNameTextField: UITextField!
    
    @IBAction func CloseKeyBoard(sender: AnyObject) {
        SearchNameTextField.resignFirstResponder()
    }
    
    @IBAction func DoneCloseKeyBoard(sender: AnyObject) {
        SearchNameTextField.resignFirstResponder()
    }
    
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        SearchNameTextField.resignFirstResponder()
        
    }
    
    
    @IBAction func toggleLeftDrawer(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.toggleLeftDrawer(sender, animated: false)
    }
    
}