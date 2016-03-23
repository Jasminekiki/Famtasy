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
    
        
}