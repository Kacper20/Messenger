//
//  User+.swift
//  MessageSender
//
//  Created by Kacper on 13.01.2015.
//  Copyright (c) 2015 Kacper. All rights reserved.
//

import Foundation
import CoreData
/* Extension of User class, that provides possibility for fetching User object for given login from database */
extension User{
    class func userWithLogin(login: String, inManagedObjectContext context:NSManagedObjectContext) -> User?{
        var user: User? = nil
        // If given login is not empty
        if countElements(login) > 0{
            let fetchRequest = NSFetchRequest(entityName: "User")
            fetchRequest.predicate = NSPredicate(format: "login = %@", login)
            var error: NSError?
            var matches = context.executeFetchRequest(fetchRequest, error: &error) as [User]?
            if let results = matches {
                // There is no object for given login in database - create one
                if results.count == 0{
                    user = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: context) as? User
                    user!.login = login
                }
                   //We have exactly one user - create it.
                else if results.count == 1{
                    user = results[0]
                }
                
            }
            else{
                fatalError("no integrity in database")
            }
        
        }
        else{
            println("Login not given")
        }
        
        return user
    }
}