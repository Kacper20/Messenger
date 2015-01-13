//
//  MessagesViewController.swift
//  MessageSender
//
//  Created by Kacper on 11.01.2015.
//  Copyright (c) 2015 Kacper. All rights reserved.
//

import UIKit
import CoreData

class RecentUserChatsViewController: CoreDataViewController {
    var managedObjectContext: NSManagedObjectContext?{
        didSet{
            self.setupFetchedResultsController()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let delegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context = delegate.managedObjectContext!
        self.managedObjectContext = context


        
        
        
        
        self.navigationController?.navigationBar.barTintColor = UIColor.orangeColor()
    }
    /* Function, that creates and sets fetched results controller to proper Fetch Request 
       It's invoked, when we're setting ManagedObjectContext */
    func setupFetchedResultsController(){
        let fetchRequest = NSFetchRequest(entityName: "User")
        // Fetch all users, that have 
        fetchRequest.predicate = nil
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "login", ascending: true, selector: "localizedStandardCompare:")]
        if let cont = managedObjectContext{
            self.fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext!, sectionNameKeyPath: nil, cacheName: nil)
            println("context jest OK!")
        }
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.usersCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        var user = self.fetchedResultsController.objectAtIndexPath(indexPath) as User
        cell.textLabel?.text = user.login
        
        return cell
        
    }
    

}
