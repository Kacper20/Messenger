//
//  MessageSender.swift
//  MessageSender
//
//  Created by Kacper on 13.01.2015.
//  Copyright (c) 2015 Kacper. All rights reserved.
//

import Foundation
import CoreData

class Message: NSManagedObject {

    @NSManaged var content: String
    @NSManaged var id: NSNumber
    @NSManaged var receivedDate: NSDate
    @NSManaged var sendDate: NSDate
    @NSManaged var receiver: User
    @NSManaged var sender: User

}
