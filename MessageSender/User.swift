//
//  User.swift
//  MessageSender
//
//  Created by Kacper on 11.01.2015.
//  Copyright (c) 2015 Kacper. All rights reserved.
//

import Foundation
import CoreData

class User: NSManagedObject {

    @NSManaged var login: String
    @NSManaged var sendMessages: NSSet
    @NSManaged var receivedMessages: NSSet

}
