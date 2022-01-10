//
//  Friend.swift
//  ChatApp
//
//  Created by Afroz on 10/01/2022.
//

import Foundation

class Friend {
    
    var name: String!
    var messages: [Message]?
    
    var lastMassage: Message? {
        get {
            return messages?.last
        }
    }
    
    init(name: String, messages: [Message]?) {
        self.name = name
        self.messages = messages
    }
    
    convenience init (name: String, firstMessage: String) {
        let message = Message(text: firstMessage, attachment: nil)
        self.init(name: name, messages: [message])
    }
    
    func addMessage(_ msg: Message) {
        if messages == nil {
            messages = [Message]()
        }
        messages?.append(msg)
    }
    
}
