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
        var message: Message?
        let jsonArray = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: nil) as NSArray
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
            
            let fetchRequest = NSFetchRequest(entityName: "Message")
            fetchRequest.predicate = NSPredicate(format: "id = %@", id)
            var error: NSError?
            var matches = managedObjectContext.executeFetchRequest(fetchRequest, error: &error) as [Message]?
            if let results = matches{
                if results.count == 0{
                    message = NSEntityDescription.insertNewObjectForEntityForName("Message", inManagedObjectContext: managedObjectContext) as? Message
                    message!.id = id
                    message!.content = content
                    message!.sendDate = sendDate
                    message!.receivedDate = receivedDate
                    message!.sender = User.userWithLogin(sender, inManagedObjectContext: managedObjectContext)!
                    message!.receiver = User.userWithLogin(receiver, inManagedObjectContext: managedObjectContext)!
                }
                else if results.count == 1{
                    continue
                }
                else{
                    println("Inconsistancy in database")
                }
            }
            else{
                println("ERROR IN DB: \(error?.localizedDescription)")
                
            }

        }
     return message
    }
}