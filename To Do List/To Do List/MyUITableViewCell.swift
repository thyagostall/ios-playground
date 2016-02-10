//
//  MyUITableViewCell.swift
//  To Do List
//
//  Created by Thyago on 2/8/16.
//  Copyright © 2016 Thyago. All rights reserved.
//

import UIKit

class MyUITableViewCell: UITableViewCell {
    
    @IBOutlet var toDoTitleLabel: UILabel!
    @IBOutlet var toDoDueDateLabel: UILabel!
    var entity: ToDoEntity!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setInternalFields(entity: ToDoEntity) {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .ShortStyle
        formatter.timeStyle = .ShortStyle
        
        self.toDoTitleLabel.text = entity.toDoTitle
        self.toDoDueDateLabel.text = formatter.stringFromDate(entity.toDoDueDate!)
        self.entity = entity
    }

}
