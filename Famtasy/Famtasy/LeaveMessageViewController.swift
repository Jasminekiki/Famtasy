//
//  LeaveMessageViewController.swift
//  KGFloatingDrawer-Example
//
//  Created by Pisces on 16/3/2.
//  Copyright © 2016年 Kyle Goddard. All rights reserved.
//

import Foundation
import UIKit

class leaveMessageViewController: UIViewController{
    @IBAction func toggleLeftDrawer(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.toggleLeftDrawer(sender, animated: false)
}
    
    
    @IBOutlet weak var MessageTextView: UITextView!
    
    @IBAction func CloseKeyBoard(sender: AnyObject) {
        MessageTextView.resignFirstResponder()
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        MessageTextView.resignFirstResponder()
       
    }
}