//
//  FamilyListViewController.swift
//  KGFloatingDrawer-Example
//
//  Created by Pisces on 16/3/21.
//  Copyright © 2016年 Kyle Goddard. All rights reserved.
//

import Foundation
import UIKit

class familyListViewController: UITableViewController{
    
    @IBAction func toggleLeftDrawer(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.toggleLeftDrawer(sender, animated: false)
}
    
}