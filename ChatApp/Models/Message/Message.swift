//
//  Message.swift
//  ChatApp
//
//  Created by Afroz on 10/01/2022.
//

import Foundation

class Message {
    
    var message: String!
    var attachment: String? // if there is any attachment
    var isMyMessage: Bool = false
    
    init(text: String, attachment: String? = nil) {
        message = text
        self.attachment = attachment
    }
    
}
