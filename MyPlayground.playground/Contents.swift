//: Playground - noun: a place where people can play
import UIKit

/**
 * Optionals
 */
func optionalsExplicitAndImplicit() {
    var explicitOptional: Int?
    var implicitOptional: Int!

    implicitOptional = 2
    explicitOptional = 5

    let explicitSum = 1 + explicitOptional!
    let implicitSum = 2 + implicitOptional

    print("This the explicit optional: \(explicitSum)")
    print("This the implicit optional: \(implicitSum)")
}

func optionalBinding(name: String?) {
    if let n = name where n.hasPrefix("T") {
        print("Howdy, \(n)")
    }
}

/**
 *
 * Class with a failure initializer
 *
 */
class Circle {
    var radius: Double
    
    init?(radius: Double) {
        self.radius = radius
        
        if radius <= 0 {
            return nil
        }
    }
    
    func printArea() {
        let area = 3.1415 * radius * radius
        print("\(area)")
    }
}

var c = Circle(radius: 10)
if let circle = c {
    c?.printArea()
} else {
    print("Circle was not initialized correctly.")
}