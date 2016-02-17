//
//  ToDoEntity+CoreDataProperties.swift
//  To Do List
//
//  Created by Thyago on 2/8/16.
//  Copyright © 2016 Thyago. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension ToDoEntity {

    @NSManaged var title: String?
    @NSManaged var priority: String?
    @NSManaged var customer: String?

}
