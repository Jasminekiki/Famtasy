//
//  ChatViewController.swift
//  Famtasy
//
//  Created by Jasmine on 16/3/22.
//  Copyright © 2016年 TAC. All rights reserved.
//

import UIKit
import SnapKit

let messageFontSize: CGFloat = 17
let toolBarMinHeight: CGFloat = 44

class ChatViewController:UITableViewController,UITextViewDelegate {
    var toolBar: UIToolbar!
    var textView: UITextView!
    var sendButton: UIButton!
    var messages:[[Message]] = [[]]
    
    override var inputAccessoryView: UIView! {
        get {
            if toolBar == nil {
                
                toolBar = UIToolbar(frame: CGRectMake(0, 0, 0, toolBarMinHeight-0.5))
                
                textView = InputTextView(frame: CGRectZero)
                textView.backgroundColor = UIColor(white: 250/255, alpha: 1)
                textView.delegate = self
                textView.font = UIFont.systemFontOfSize(messageFontSize)
                textView.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 205/255, alpha:1).CGColor
                textView.layer.borderWidth = 0.5
                textView.layer.cornerRadius = 5
                //            textView.placeholder = "Message"
                textView.scrollsToTop = false
                textView.textContainerInset = UIEdgeInsetsMake(4, 3, 3, 3)
                toolBar.addSubview(textView)
                
                sendButton = UIButton(type: .System)
                sendButton.enabled = false
                sendButton.titleLabel?.font = UIFont.boldSystemFontOfSize(17)
                sendButton.setTitle("Send", forState: .Normal)
                sendButton.setTitleColor(UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1), forState: .Disabled)
                sendButton.setTitleColor(UIColor(red: 0.05, green: 0.47, blue: 0.91, alpha: 1.0), forState: .Normal)
                sendButton.contentEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
                sendButton.addTarget(self, action: "sendAction", forControlEvents: UIControlEvents.TouchUpInside)
                toolBar.addSubview(sendButton)
                
                // Auto Layout allows `sendButton` to change width, e.g., for localization.
                
                textView.translatesAutoresizingMaskIntoConstraints = false;
                sendButton.translatesAutoresizingMaskIntoConstraints = false;
                textView.snp_makeConstraints(closure: { (make) -> Void in
                    
                    make.left.equalTo(self.toolBar.snp_left).offset(8)
                    make.top.equalTo(self.toolBar.snp_top).offset(7.5)
                    make.right.equalTo(self.sendButton.snp_left).offset(-2)
                    make.bottom.equalTo(self.toolBar.snp_bottom).offset(-8)
                    
                    
                })
                sendButton.snp_makeConstraints(closure: { (make) -> Void in
                    make.right.equalTo(self.toolBar.snp_right)
                    make.bottom.equalTo(self.toolBar.snp_bottom).offset(-4.5)
                    
                })
                
            }
            return toolBar
        }
    }
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(MessageSentDateTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(MessageSentDateTableViewCell))
        
        
        self.tableView.keyboardDismissMode = .Interactive
        self.tableView.estimatedRowHeight = 44
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom:toolBarMinHeight, right: 0)
        self.tableView.separatorStyle = .None
        messages = [
            [
                Message(incoming: true, text: "你叫什么名字？", sentDate: NSDate(timeIntervalSinceNow: -12*60*60*24)),
                Message(incoming: false, text: "我叫灵灵，聪明又可爱的灵灵", sentDate: NSDate(timeIntervalSinceNow:-12*60*60*24))
            ],
            [
                Message(incoming: true, text: "你爱不爱我？", sentDate: NSDate(timeIntervalSinceNow: -6*60*60*24 - 200)),
                Message(incoming: false, text: "爱你么么哒", sentDate: NSDate(timeIntervalSinceNow: -6*60*60*24 - 100))
            ],
                    ]
        
        
        
        // Do any additional setup after loading the view.
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        
        
        return messages.count
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messages[section].count + 1
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            
            let cellIdentifier = NSStringFromClass(MessageSentDateTableViewCell)
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier,forIndexPath: indexPath) as! MessageSentDateTableViewCell
            let message = messages[indexPath.section][0]
            
            
            cell.sentDateLabel.text = formatDate(message.sentDate)
            
            return cell
            
        }else{
            let cellIdentifier = NSStringFromClass(MessageBubbleTableViewCell)
            var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! MessageBubbleTableViewCell!
            if cell == nil {
                
                cell = MessageBubbleTableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
            }
            
            
            
            let message = messages[indexPath.section][indexPath.row - 1]
            
            cell.configureWithMessage(message)
            
            
            
            
            return cell
        }
        
    }
    func formatDate(date: NSDate) -> String {
        let calendar = NSCalendar.currentCalendar()
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "zh_CN")
        
        let last18hours = (-18*60*60 < date.timeIntervalSinceNow)
        let isToday = calendar.isDateInToday(date)
        let isLast7Days = (calendar.compareDate(NSDate(timeIntervalSinceNow: -7*24*60*60), toDate: date, toUnitGranularity: .Calendar) == NSComparisonResult.OrderedAscending)
        
        if last18hours || isToday {
            dateFormatter.dateFormat = "a HH:mm"
        } else if isLast7Days {
            dateFormatter.dateFormat = "MM月dd日 a HH:mm EEEE"
        } else {
            dateFormatter.dateFormat = "YYYY年MM月dd日 a HH:mm"
            
        }
        return dateFormatter.stringFromDate(date)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
class InputTextView: UITextView {
    
    
    
}

