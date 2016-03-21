//
//  PersonalViewController.swift
//  KGFloatingDrawer-Example
//
//  Created by Pisces on 16/3/2.
//  Copyright © 2016年 Kyle Goddard. All rights reserved.
//

import Foundation
import UIKit

class personalMainViewController: UIViewController{
    @IBAction func toggleLeftDrawer(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.toggleLeftDrawer(sender, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}