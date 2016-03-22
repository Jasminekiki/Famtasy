//
//  UserListViewController.swift
//  KGFloatingDrawer-Example
//
//  Created by Pisces on 16/3/3.
//  Copyright © 2016年 Kyle Goddard. All rights reserved.
//

import Foundation
import UIKit

class userListViewController: UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 2;
//    }
//    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("UserCell");
//        return cell!;
//    }
//    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
                    let ChatVC:ChatViewController = ChatViewController()
                    ChatVC.title = "Mom"
        
        
                    UINavigationBar.appearance().tintColor = UIColor(red:0.94, green:0.24, blue:0.37, alpha:1)
                    UINavigationBar.appearance().barTintColor = UIColor(red: 72/255, green: 152/255, blue: 136/255, alpha: 1.0)
                    UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
                    //UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        
                    let navigationVC:UINavigationController = UINavigationController(rootViewController: ChatVC)
                    self.navigationController?.pushViewController(navigationVC, animated: true);
        
        
    }
   

}