//
//  MyUITableViewController.swift
//  To Do List
//
//  Created by Thyago on 2/8/16.
//  Copyright © 2016 Thyago. All rights reserved.
//

import UIKit
import CoreData

class MyUITableViewController: UITableViewController, TSHandlersMOC, NSFetchedResultsControllerDelegate {
    
    var managedObjectContext: NSManagedObjectContext!
    var resultsController: NSFetchedResultsController!

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeNSFetchedResultsControllerDelegate()
    }
    
    func initializeNSFetchedResultsControllerDelegate() {
        let fetchRequest = NSFetchRequest()
        fetchRequest.entity = NSEntityDescription.entityForName("ToDoEntity", inManagedObjectContext: self.managedObjectContext)
        fetchRequest.predicate = NSPredicate(format: "TRUEPREDICATE")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "toDoTitle", ascending: true)]
        
        self.resultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        self.resultsController.delegate = self
        
        try! self.resultsController.performFetch()
    }
    
    func receiveMOC(incoming: NSManagedObjectContext) {
        self.managedObjectContext = incoming
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resultsController.sections![section].numberOfObjects
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = self.resultsController.sections![indexPath.section].objects![indexPath.row] as! ToDoEntity

        let cell = tableView.dequeueReusableCellWithIdentifier("MyUITableViewCell", forIndexPath: indexPath) as! MyUITableViewCell
        cell.setInternalFields(item)
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let child = segue.destinationViewController
        (child as! TSHandlersMOC).receiveMOC(self.managedObjectContext)
        
        let item = NSEntityDescription.insertNewObjectForEntityForName("ToDoEntity", inManagedObjectContext: self.managedObjectContext) as! ToDoEntity
        (child as! TSHandlersToDoEntity).receiveToDoEntity(item)
    }
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        self.tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        self.tableView.endUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch (type) {
        case .Insert:
            self.tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade)
            break
        case .Delete:
            self.tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
            break
        case .Update:
            let cell = self.tableView.cellForRowAtIndexPath(indexPath!) as! MyUITableViewCell
            let item = controller.objectAtIndexPath(indexPath!) as! ToDoEntity
            cell.setInternalFields(item)
            break
        case .Move:
            self.tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
            self.tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade)
            break
        }
    }

}
