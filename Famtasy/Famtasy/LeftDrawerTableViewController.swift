//
//  LeftDrawerTableViewController.swift
//  KGDrawerViewController
//
//  Created by Kyle Goddard on 2015-02-16.
//  Copyright (c) 2015 Kyle Goddard. All rights reserved.
//

import UIKit

class LeftDrawerTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: <TableViewDataSource>
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        if indexPath.row == 2 {
            appDelegate.centerViewController = appDelegate.personalMainViewController()
            
        } else if indexPath.row == 3 {
            appDelegate.centerViewController = appDelegate.createFamilyViewController()
        }
        else if indexPath.row == 4 {
            appDelegate.centerViewController = appDelegate.familyListViewController()
        

        }
        else if indexPath.row == 5 {
            appDelegate.centerViewController = appDelegate.familyZoneViewController()
        }
        else if indexPath.row == 6 {
            appDelegate.centerViewController = appDelegate.scheduleTableViewController()
        }
        else if indexPath.row == 7 {
            appDelegate.centerViewController = appDelegate.drawerSettingsViewController()
            
            
        }

        
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
    }

}
