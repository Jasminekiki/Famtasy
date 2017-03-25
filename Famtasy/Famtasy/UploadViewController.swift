//
//  UploadViewController.swift
//  Famtasy
//
//  Created by Pisces on 16/3/23.
//  Copyright © 2016年 TAC. All rights reserved.
//

import Foundation
import UIKit

class uploadViewController : UIViewController{
    
    @IBOutlet weak var UploadTextView: UITextView!
    
    @IBAction func CloseKeyBoard(sender: AnyObject) {
        UploadTextView.resignFirstResponder()
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        UploadTextView.resignFirstResponder()
        
    }
    
    @IBAction func buttnClick(sender: UIButton?){
        let familyZoneVC = self.storyboard?.instantiateViewControllerWithIdentifier("familyZoneTableStoryboardId") as?familyZoneViewController;
        let date = NSDate();
        let dateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "yyyy-MM-dd";
    
        
        let timeFormatter = NSDateFormatter();
        timeFormatter.dateFormat = "HH:mm";
        let currentDate = dateFormatter.stringFromDate(date);
        let currentTime = timeFormatter.stringFromDate(date) as String;
        var content = String();
        content = UploadTextView.text;
        familyZoneVC?.textInfo.append((time: currentTime, date: currentDate, owner: "Son", content: content, image1: "No", image2: "No", image3 :"No"));
        navigationController?.pushViewController(familyZoneVC!, animated: true);
    }
    
        
}