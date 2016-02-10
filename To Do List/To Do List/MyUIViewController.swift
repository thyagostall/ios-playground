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
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var detailsField: UITextView!
    @IBOutlet var dueDateField: UIDatePicker!

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
        self.titleField.text = self.localToDoEntity.toDoTitle
        self.detailsField.text = self.localToDoEntity.toDoDetails
        
        if let date = self.localToDoEntity.toDoDueDate {
            self.dueDateField.date = date
        }
    }
    
    @IBAction func titleFieldChanged(sender: UITextField) {
    
    }

}

