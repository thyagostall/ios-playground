//
//  TSHandlersToDoEntity.swift
//  To Do List
//
//  Created by Thyago on 2/8/16.
//  Copyright © 2016 Thyago. All rights reserved.
//

import Foundation
import CoreData

protocol TSHandlersToDoEntity {
    func receiveToDoEntity(incomingToDoEntity: ToDoEntity)
}
