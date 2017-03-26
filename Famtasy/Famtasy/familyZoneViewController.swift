//
//  familyZoneViewController.swift
//  Timeline
//
//  Created by Jasmine on 16/3/2.
//  Copyright © 2016年 Larry Zhang. All rights reserved.
//



import UIKit

class familyZoneViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBAction func toggleLeftDrawer(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.toggleLeftDrawer(sender, animated: false)
    }

    @IBOutlet weak var table: UITableView!
    var threshold = "2016-2-28"
    var textInfo = [
        
            (time: "9:47", date: "2016-2-28", owner: "Pisces", content: "there is only one day left before my next semester :(",image1: "No", image2: "No", image3: "No"),
            (time: "10:50", date: "2016-2-28", owner: "Aries", content: "I love you, my dear baby!",image1: "No", image2: "No", image3: "No"),
            (time: "0:00", date: "2016-2-29", owner: "Aries", content: "Happy birthday! my dear!",image1: "Son.jpg", image2: "No", image3: "No"),
            (time: "18:20", date: "2016-2-29", owner: "Simon", content: "Take care of yourself, my son!",image1: "No", image2: "No", image3: "No"),
        (time: "7:30", date: "2016-3-1", owner: "Pisces", content: "Look! Weeine misses you so much :)", image1: "dog.jpg", image2: "dog2.jpg", image3: "dog3.jpg"),
            (time: "15:30", date: "2016-3-2", owner: "Simon", content: "Thanks a lot! my dear dad and mum!",image1: "No", image2: "No", image3: "No"),
            ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.registerNib(UINib(nibName: "textCell", bundle: nil), forCellReuseIdentifier: "textCell")

        let footer = UIView()
        footer.frame = CGRect(origin: CGPointZero, size: CGSize(width: 0, height: 25))
        table.tableFooterView = footer
    }
    
    // MARK: - Table view data source
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textInfo.count
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(textInfo[indexPath.row].image1 == "No"){
            return 130;
        }else{
            return 280;
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("textCell", forIndexPath: indexPath) as!
        textCell
        cell.setRectangle();
        cell.setRidues();
        cell.timeLabel.text = textInfo[indexPath.row].time
        cell.dateLabel.text = textInfo[indexPath.row].date
        cell.ownerLabel.text = textInfo[indexPath.row].owner
        cell.contentLabel.text = textInfo[indexPath.row].content
        cell.contentLabel.numberOfLines = 0;
        
        if(cell.dateLabel.text == threshold ){
            if(indexPath.row != 0){
                 cell.dateLabel.hidden = true;
            }
           
        }
        else{
            threshold = cell.dateLabel.text!;
        }
        
        if(textInfo[indexPath.row].image1 == "No"){
            cell.withoutPicture(3);
        }else if(textInfo[indexPath.row].image2 == "No"){
            cell.image1.image =  UIImage(named: textInfo[indexPath.row].image1);
            cell.withoutPicture(2);
        }else if(textInfo[indexPath.row].image3 == "No"){
            cell.image1.image =  UIImage(named: textInfo[indexPath.row].image1);
            cell.image2.image =  UIImage(named: textInfo[indexPath.row].image2);
            cell.withoutPicture(1);
        }else{
            cell.withoutPicture(0);
            cell.image1.image =  UIImage(named: textInfo[indexPath.row].image1);
            cell.image2.image =  UIImage(named: textInfo[indexPath.row].image2);
            cell.image3.image =  UIImage(named: textInfo[indexPath.row].image3);
        }
        return cell
    }
    
}


