//
//  MessagesViewController.swift
//  MessageSender
//
//  Created by Kacper on 10.01.2015.
//  Copyright (c) 2015 Kacper. All rights reserved.
//

import UIKit
import CoreData

let cellIdentifier = "MessageCellIdentifier"
class MessagesViewController: UIViewController, NSFetchedResultsControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    // The controller to set
    // If it's set to proper request, class will perform showing it.
    var fetchedResultsController: NSFetchedResultsController!
    
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        fetchedResultsController.delegate = self
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let fetchRequest = NSFetchRequest(entityName: "Message")
        
    }
    
    // MARK: -foo
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fetchedResultsController.sections!.count
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = fetchedResultsController.sections![section] as NSFetchedResultsSectionInfo
        return sectionInfo.numberOfObjects
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        return cell
        }
    func configureCell(cell:UITableViewCell, indexPath:NSIndexPath){
        println("configure")
    }
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        self.tableView.beginUpdates()
    }
    func controllerDidChangeContent(controller: NSFetchedResultsController!) {
        tableView.endUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        let indexSet = NSIndexSet(index: sectionIndex)
        switch type {
    case .Insert:
        tableView.insertSections(indexSet, withRowAnimation: .Automatic)
    case .Delete:
        tableView.deleteSections(indexSet, withRowAnimation: .Automatic)
    default :
        break
        }
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type:NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type{
        case .Delete:
            tableView.deleteRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Automatic)
        case .Update:
            let cell = tableView.cellForRowAtIndexPath(indexPath!) as UITableViewCell!
            configureCell(cell!, indexPath: indexPath!)
        case .Move:
            tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Automatic)
            tableView.insertRowsAtIndexPaths([newIndexPath!],withRowAnimation: .Automatic)
        default:
            break
        }
        
    }
    
}





    
    




