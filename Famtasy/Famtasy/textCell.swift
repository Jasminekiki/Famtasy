//
//  Person.swift
//  Timeline
//
//  Created by Larry Zhang on 4/3/15.
//  Copyright (c) 2015 Larry Zhang. All rights reserved.
//

import UIKit

class textCell: UITableViewCell {

   
    @IBOutlet weak var timeLabel: UILabel!

    @IBOutlet weak var ownerLabel: UILabel!

    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var commentButton: UIButton!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    
    @IBOutlet weak var commentView: UITableView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    @IBOutlet weak var commentLayOut: NSLayoutConstraint!
    
    @IBOutlet weak var commentLayOutWitoutPic: NSLayoutConstraint!
    
    func withoutPicture(imageNumber: Int){
        if(imageNumber == 0){
//            commentLayOut.active = true;
//            commentLayOutWitoutPic.active = false;
            print(commentLayOutWitoutPic.active);

        }else if(imageNumber == 1){
            image3.hidden = true;
//            commentLayOut.active = true;
//            commentLayOutWitoutPic.active = false;
            print(commentLayOutWitoutPic.active);
        }
        else if(imageNumber == 2){
            image2.hidden = true;
            image3.hidden = true;
            //commentLayOut.active = true;
            //commentLayOutWitoutPic.active = false;
            print(commentLayOutWitoutPic.active);
        }
        else{
            image1.hidden = true;
            image2.hidden = true;
            image3.hidden = true;
            
            //commentLayOut.active = false;
            //commentLayOutWitoutPic.active = true;
            print(commentLayOutWitoutPic.active);
        }
    }
    
    func setRidues(){
        timeLabel?.layer.cornerRadius = timeLabel.frame.size.width/2;
        timeLabel?.layer.masksToBounds = true;
    }

    
    //Set the comment button to rounded recktangle
    func setRectangle(){
        commentButton.layer.cornerRadius = timeLabel.frame.size.width/5;
        commentButton.layer.masksToBounds = true;
    }


    
}
