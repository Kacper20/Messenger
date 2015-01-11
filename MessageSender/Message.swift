//
//  Message.swift
//  MessageSender
//
//  Created by Kacper on 11.01.2015.
//  Copyright (c) 2015 Kacper. All rights reserved.
//

import Foundation
import CoreData

class Message: NSManagedObject {

    @NSManaged var content: String
    @NSManaged var receivedDate: NSDate
    @NSManaged var id: NSNumber
    @NSManaged var sendDate: NSDate
    @NSManaged var sender: User
    @NSManaged var receiver: User

}
