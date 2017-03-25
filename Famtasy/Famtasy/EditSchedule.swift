//
//  EditSchedule.swift
//  Famtasy
//
//  Created by Pisces on 16/3/23.
//  Copyright © 2016年 TAC. All rights reserved.
//

import Foundation
import UIKit

class editScheduleViewController: UIViewController {
    
    @IBOutlet weak var StartTimeDP: UIDatePicker!
    
    @IBOutlet weak var StopTimeDP: UIDatePicker!
    
    @IBOutlet weak var EventTextField: UITextField!
    
    
    @IBOutlet weak var LocationTextField: UITextField!
    
    @IBAction func CloseKeyBoard(sender: AnyObject) {
        
        EventTextField.resignFirstResponder()
        LocationTextField.resignFirstResponder()
    }
    
    @IBAction func DoneCloseKeyBoard(sender: AnyObject) {
        EventTextField.resignFirstResponder()
        LocationTextField.resignFirstResponder()
    }
    
    
    @IBAction func AddSchedule(sender: UIButton) {
        let scheduleTableVC = self.storyboard?.instantiateViewControllerWithIdentifier("scheduleTableStoryboardId") as?ScheduleTableViewController;
        //let date = NSDate();
        let dateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "yyyy-MM-dd";
        
        
        let timeFormatter = NSDateFormatter();
        timeFormatter.dateFormat = "HH:mm";
        let day = dateFormatter.stringFromDate(StartTimeDP.date);
        let startTime = timeFormatter.stringFromDate(StartTimeDP.date) as String;
        let stopTime = timeFormatter.stringFromDate(StopTimeDP.date) as String;
        
        var event = String();
        event = EventTextField.text!;
        var location = String();
        location = LocationTextField.text!;
        
        scheduleTableVC?.eventInfo.append((day: day, start: startTime, end: stopTime, event: event, Location: location));
        navigationController?.pushViewController(scheduleTableVC!, animated: true);
    }
    
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        EventTextField.resignFirstResponder()
        LocationTextField.resignFirstResponder()
    }
}