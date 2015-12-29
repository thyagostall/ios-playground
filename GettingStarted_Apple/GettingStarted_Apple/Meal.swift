//
//  Meal.swift
//  GettingStarted_Apple
//
//  Created by Thyago on 12/29/15.
//  Copyright © 2015 Thyago. All rights reserved.
//

import UIKit

class Meal {
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init?(name: String, photo: UIImage?, rating: Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
}
