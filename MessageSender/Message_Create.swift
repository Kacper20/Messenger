//
//  Message_Create.swift
//  MessageSender
//
//  Created by Kacper on 13.01.2015.
//  Copyright (c) 2015 Kacper. All rights reserved.
//

import Foundation
import CoreData

extension Message{
    class func messageWithJsonData(jsonData: NSData, intoManagedObjectContext managedObjectContext: NSManagedObjectContext) -> Message?{
        var error: NSError?
        let jsonArray = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &error) as NSArray
        let messageEntity = NSEntityDescription.entityForName("Message", inManagedObjectContext: managedObjectContext)
        for jsonDict in jsonArray{
            let id = jsonDict["id"] as NSNumber
            let content = jsonDict["content"] as String
            let send = jsonDict["send"] as NSNumber
            let received = jsonDict["received"] as NSNumber
            let sender = jsonDict["sender"] as String
            let receiver = jsonDict["receiver"] as String
            let sendDate = NSDate(timeIntervalSince1970: send.doubleValue)
            let receivedDate = NSDate(timeIntervalSince1970: received.doubleValue)
            
            
            
            
            let message: Message = NSEntityDescription.insertNewObjectForEntityForName("Message", inManagedObjectContext: managedObjectContext) as Message
            message.id = id
            message.content = content
            message.sendDate = sendDate
            message.receivedDate = receivedDate
            message.sender = User.userWithLogin(sender, inManagedObjectContext: managedObjectContext)!
            message.receiver = User.userWithLogin(receiver, inManagedObjectContext: managedObjectContext)!
        }
        
    }
}