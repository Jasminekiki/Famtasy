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
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let ChatVC:ChatViewController = ChatViewController()
        ChatVC.title = "Mom"
        
        
        UINavigationBar.appearance().tintColor = UIColor(red:0.94, green:0.24, blue:0.37, alpha:1)
        UINavigationBar.appearance().barTintColor = UIColor(red: 72/255, green: 152/255, blue: 136/255, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        
        let navigationVC:UINavigationController = UINavigationController(rootViewController: ChatVC)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.centerViewController = navigationVC;
        
        
    }

    
}