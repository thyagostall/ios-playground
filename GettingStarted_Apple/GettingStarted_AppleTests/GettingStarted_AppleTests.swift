//
//  GettingStarted_AppleTests.swift
//  GettingStarted_AppleTests
//
//  Created by Thyago on 12/29/15.
//  Copyright © 2015 Thyago. All rights reserved.
//

import XCTest
@testable import GettingStarted_Apple

class GettingStarted_AppleTests: XCTestCase {
    // MARK: FoodTracker Tests
    
    func testMealInitialization() {
        let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        let noName = Meal(name: "", photo: nil, rating: 1)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let invalidRating = Meal(name: "Some meal", photo: nil, rating: -1)
        XCTAssertNil(invalidRating, "Rating must be between 0 and 5")
    }
}
