//
//  MessageBubbleTableViewCell.swift
//  Famtasy
//
//  Created by Jasmine on 16/3/22.
//  Copyright © 2016年 TAC. All rights reserved.
//

import UIKit
import SnapKit
let incomingTag = 0, outgoingTag = 1
let bubbleTag = 8

class MessageBubbleTableViewCell:UITableViewCell{
    let bubbleImageView: UIImageView
    let messageLabel: UILabel
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        bubbleImageView = UIImageView(image: bubbleImage.incoming, highlightedImage: bubbleImage.incomingHighlighed)
        bubbleImageView.tag = bubbleTag
        bubbleImageView.userInteractionEnabled = true // #CopyMesage
        
        messageLabel = UILabel(frame: CGRectZero)
        messageLabel.font = UIFont.systemFontOfSize(messageFontSize)
        messageLabel.numberOfLines = 0
        messageLabel.userInteractionEnabled = false   // #CopyMessage
        
        super.init(style: .Default, reuseIdentifier: reuseIdentifier)
        selectionStyle = .None
        
        contentView.addSubview(bubbleImageView)
        bubbleImageView.addSubview(messageLabel)
        
        bubbleImageView.translatesAutoresizingMaskIntoConstraints = false;
        messageLabel.translatesAutoresizingMaskIntoConstraints = false;
        bubbleImageView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(contentView.snp_left).offset(10)
            make.top.equalTo(contentView.snp_top).offset(4.5)
            make.width.equalTo(messageLabel.snp_width).offset(30)
            make.bottom.equalTo(contentView.snp_bottom).offset(-4.5)
            
            
        }
        messageLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(bubbleImageView.snp_centerX).offset(3)
            make.centerY.equalTo(bubbleImageView.snp_centerY).offset(-0.5)
            messageLabel.preferredMaxLayoutWidth = 218
            make.height.equalTo(bubbleImageView.snp_height).offset(-15)
            
        }
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureWithMessage(message: Message) {
        messageLabel.text = message.text
        
        
        
        let constraints: NSArray = contentView.constraints
        let indexOfConstraint = constraints.indexOfObjectPassingTest { (var constraint, idx, stop) in
            return (constraint.firstItem as! UIView).tag == bubbleTag && (constraint.firstAttribute == NSLayoutAttribute.Left || constraint.firstAttribute == NSLayoutAttribute.Right)
        }
        contentView.removeConstraint(constraints[indexOfConstraint] as! NSLayoutConstraint)
        bubbleImageView.snp_makeConstraints(closure:{ (make) -> Void in
            if message.incoming {
                tag = incomingTag
                bubbleImageView.image = bubbleImage.incoming
                bubbleImageView.highlightedImage = bubbleImage.incomingHighlighed
                messageLabel.textColor = UIColor.blackColor()
                make.left.equalTo(contentView.snp_left).offset(10)
                messageLabel.snp_updateConstraints { (make) -> Void in
                    make.centerX.equalTo(bubbleImageView.snp_centerX).offset(3)
                }
                
            } else { // outgoing
                tag = outgoingTag
                bubbleImageView.image = bubbleImage.outgoing
                bubbleImageView.highlightedImage = bubbleImage.outgoingHighlighed
                messageLabel.textColor = UIColor.whiteColor()
                make.right.equalTo(contentView.snp_right).offset(-10)
                messageLabel.snp_updateConstraints { (make) -> Void in
                    make.centerX.equalTo(bubbleImageView.snp_centerX).offset(-3)
                }
                
                
            }
        })
        
        
    }
    
    // 设置cell高亮
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        bubbleImageView.highlighted = selected
    }
}

let bubbleImage = bubbleImageMake()

func bubbleImageMake() -> (incoming: UIImage, incomingHighlighed: UIImage, outgoing: UIImage, outgoingHighlighed: UIImage) {
    let maskOutgoing = UIImage(named: "MessageBubble")!
    
    let maskIncoming = UIImage(CGImage: maskOutgoing.CGImage!, scale: 2, orientation: .UpMirrored)
    
    let capInsetsIncoming = UIEdgeInsets(top: 17, left: 26.5, bottom: 17.5, right: 21)
    let capInsetsOutgoing = UIEdgeInsets(top: 17, left: 21, bottom: 17.5, right: 26.5)
    
    let incoming = coloredImage(maskIncoming, red: 229/255, green: 229/255, blue: 234/255, alpha: 1).resizableImageWithCapInsets(capInsetsIncoming);
    //let incoming = coloredImage(maskIncoming, red: 229/255, green: 229/255, blue: 234/255, alpha: 1)
    let incomingHighlighted = coloredImage(maskIncoming, red: 206/255, green: 206/255, blue: 210/255, alpha: 1).resizableImageWithCapInsets(capInsetsIncoming)
    let outgoing = coloredImage(maskOutgoing,  red: 113/255 ,green: 182/255,blue: 171/255,alpha: 1.0).resizableImageWithCapInsets(capInsetsOutgoing)
    let outgoingHighlighted = coloredImage(maskOutgoing, red: 72/255, green: 152/255, blue: 136/255, alpha: 1).resizableImageWithCapInsets(capInsetsOutgoing)
    
    return (incoming, incomingHighlighted, outgoing, outgoingHighlighted)
}

func coloredImage(image: UIImage, red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIImage! {
    let rect = CGRect(origin: CGPointZero, size: image.size)
    UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
    let context = UIGraphicsGetCurrentContext()
    image.drawInRect(rect)
    CGContextSetRGBFillColor(context, red, green, blue, alpha)
    CGContextSetBlendMode(context, CGBlendMode.SourceAtop);
    CGContextFillRect(context, rect)
    let result = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return result
}
