//
//  ViewController.swift
//  Week1Project
//
//  Created by Thyago on 1/23/16.
//  Copyright © 2016 Thyago. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        setMapLocation()
        setWebPage()
    }
    
    func setWebPage() {
        let url = NSURL(string: "http://www.thyago.com")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    func setMapLocation() {
        var currentLocation = CLLocationCoordinate2D()
        currentLocation.latitude = 42.7255561
        currentLocation.longitude = -84.4816436
        
        let region = MKCoordinateRegionMakeWithDistance(currentLocation, 1000, 1000)
        mapView.setRegion(region, animated: true)
    }


}

