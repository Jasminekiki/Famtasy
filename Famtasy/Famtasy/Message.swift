//
//  Message.swift
//  Famtasy
//
//  Created by Jasmine on 16/3/22.
//  Copyright © 2016年 TAC. All rights reserved.
//

import Foundation.NSDate

class Message {
    let incoming: Bool
    let text: String
    let sentDate: NSDate
    
    init(incoming: Bool, text: String, sentDate: NSDate) {
        self.incoming = incoming
        self.text = text
        self.sentDate = sentDate
    }
}
