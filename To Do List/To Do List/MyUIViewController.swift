//
//  ViewController.swift
//  To Do List
//
//  Created by Thyago on 2/8/16.
//  Copyright © 2016 Thyago. All rights reserved.
//

import UIKit
import CoreData

class MyUIViewController: UIViewController, TSHandlersMOC, TSHandlersToDoEntity {
    
    var managedObjectContext: NSManagedObjectContext!
    var localToDoEntity: ToDoEntity!
    
    var wasDeleted: Bool = false
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var priority: UISegmentedControl!
    @IBOutlet var customer: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func receiveMOC(incoming: NSManagedObjectContext) {
        self.managedObjectContext = incoming
    }

    func receiveToDoEntity(incomingToDoEntity: ToDoEntity) {
        self.localToDoEntity = incomingToDoEntity
    }
    
    override func viewWillAppear(animated: Bool) {
        self.wasDeleted = false
        
        titleField.text = localToDoEntity.title
        if let priorityItem = localToDoEntity.priority {
            priority.selectedSegmentIndex = Int(priorityItem)!
        }
        customer.text = localToDoEntity.customer
    }
    
    override func viewWillDisappear(animated: Bool) {
        if (wasDeleted) {
            return
        }
        
        localToDoEntity.title = titleField.text
        localToDoEntity.priority = String(priority.selectedSegmentIndex)
        localToDoEntity.customer = customer.text
        
        saveData()
    }
    
    func saveData() {
        do {
            try managedObjectContext.save()
//            print("Saved")
        } catch {
//            print("Error")
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
//        self.localToDoEntity.toDoDetails = self.detailsField.text
//        self.saveData()
    }
    
    @IBAction func titleFieldChanged(sender: UITextField) {
//        self.localToDoEntity.toDoTitle = sender.text
//        self.saveData()
    }

    @IBAction func dateChanged(sender: UIDatePicker) {
//        self.localToDoEntity.toDoDueDate = sender.date
//        self.saveData()
    }
    
    @IBAction func deleteItem(sender: UIBarButtonItem) {
        wasDeleted = true
        managedObjectContext.deleteObject(self.localToDoEntity)
        saveData()
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
}

