//
//  scheduleViewController.swift
//  Schedule
//
//  Created by Jasmine on 16/3/21.
//  Copyright © 2016年 TAC. All rights reserved.
//

import UIKit

class ScheduleTableViewController: UITableViewController {
   
    @IBAction func toggleLeftDrawer(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.toggleLeftDrawer(sender, animated: false)
    }

    
    @IBOutlet var ScheduleView: UITableView!
    var eventInfo = [(day: "2016-2-16", start: "9:00", end: "11:00", event: "Meeting", Location: "Apple Co."), (day: "2016-2-16", start: "11:30", end: "13:30", event: "Lunch & Available", Location: "Apple Co."), (day: "2016-2-16", start: "14:00", end: "17:00", event: "Coding", Location: "Apple Co."), (day: "2016-2-16", start: "17:30", end: "18:30", event: "On the way home", Location: "Shanghai"), (day: "2016-2-16", start: "19:00", end: "23:30", event: "Available", Location: "Home"), (day: "2016-2-17", start: "8:00", end: "11:30", event: "Shopping", Location: "Jing'an District")
    ]
    var numberOfCell = 7;
    override func viewDidLoad() {
        super.viewDidLoad();
        ScheduleView.registerNib(UINib(nibName: "eventCell", bundle: nil), forCellReuseIdentifier: "eventCell")
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventInfo.count;
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 135;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = ScheduleView.dequeueReusableCellWithIdentifier("eventCell", forIndexPath: indexPath) as! eventCell;
        if (indexPath.row==0){
            cell.dayLabel.text = eventInfo[indexPath.row].day;
        }else if (eventInfo[indexPath.row].day == eventInfo[indexPath.row-1].day){
            cell.dayLabel.hidden = true;
        }else{
            cell.dayLabel.text = eventInfo[indexPath.row].day;
        }

        cell.startLabel.text = eventInfo[indexPath.row].start;
        cell.endLabel.text = eventInfo[indexPath.row].end;
        cell.eventLabel.text = eventInfo[indexPath.row].event;
        cell.locationLabel.text = eventInfo[indexPath.row].Location;
        return cell;
        
    }

    
}

