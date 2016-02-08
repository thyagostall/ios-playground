//
//  MyUINavigationControllerViewController.swift
//  To Do List
//
//  Created by Thyago on 2/8/16.
//  Copyright © 2016 Thyago. All rights reserved.
//

import UIKit
import CoreData

class MyUINavigationControllerViewController: UINavigationController, TSHandlersMOC {
    
    var managedObjectContext: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func receiveMOC(incoming: NSManagedObjectContext) {
        self.managedObjectContext = incoming
        let child = self.viewControllers[0] as! TSHandlersMOC
        child.receiveMOC(self.managedObjectContext)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
