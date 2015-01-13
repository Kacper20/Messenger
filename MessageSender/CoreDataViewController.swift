//
//  MessagesViewController.swift
//  MessageSender
//
//  Created by Kacper on 10.01.2015.
//  Copyright (c) 2015 Kacper. All rights reserved.
//

import UIKit
import CoreData

class CoreDataViewController: UIViewController, NSFetchedResultsControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    // The controller to set
    // If it's set to proper request, class will perform showing it.
    var fetchedResultsController: NSFetchedResultsController!{
        didSet{
            if fetchedResultsController != oldValue{
                tableView.delegate = self
                tableView.dataSource = self
                fetchedResultsController.delegate = self
                if fetchedResultsController != nil{
                    self.performFetch()
                }
                else{
                    self.tableView.reloadData()
                }
            }
        }
    }
    override func viewDidLoad() {
        
    }
    func performFetch(){
        var error: NSError?
        self.fetchedResultsController.performFetch(&error)
        self.tableView.reloadData()
    }
    // MARK: -foo
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        printf
//        return fetchedResultsController.sections!.count
//    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = fetchedResultsController.sections![section] as NSFetchedResultsSectionInfo
        println("number: \(sectionInfo.numberOfObjects)")
        return sectionInfo.numberOfObjects
    }
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return self.fetchedResultsController.sections?[section].name
//    }
    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        return self.fetchedResultsController.sectionForSectionIndexTitle(title, atIndex: index)
    }
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]! {
        return self.fetchedResultsController.sectionIndexTitles
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        fatalError("ERROR, You should override cell for row at Index Path in subclass of Core Data View Controller!")
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
        case .Insert:
            self.tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Automatic)
        case .Delete:
            tableView.deleteRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Automatic)
        case .Update:
            self.tableView.reloadRowsAtIndexPaths([indexPath!], withRowAnimation: .Automatic)
        case .Move:
            tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Automatic)
            tableView.insertRowsAtIndexPaths([newIndexPath!],withRowAnimation: .Automatic)
        default:
            break
        }
        
    }
    
}





    
    




