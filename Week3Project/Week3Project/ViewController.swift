//
//  ViewController.swift
//  Week3Project
//
//  Created by Thyago on 2/4/16.
//  Copyright © 2016 Thyago. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!
    @IBOutlet var toggleTrackUser: UISwitch!
    
    var msuPin: MKPointAnnotation!
    var hometownPin: MKPointAnnotation!
    var favoritePlacePin: MKPointAnnotation!
    var currentPin: MKPointAnnotation!
    
    var locationManager: CLLocationManager!
    
    var touched = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPins()
        
        let viewRegion = MKCoordinateRegionMakeWithDistance(msuPin.coordinate, 5500, 5500)
        mapView.setRegion(viewRegion, animated: false)
        mapView.centerCoordinate = msuPin.coordinate

        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        mapView.showsUserLocation = true
        mapView.delegate = self

        toggleTrackUser.on = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentPin.coordinate = (locations.last?.coordinate)!

        if (!touched) {
            mapView.centerCoordinate = currentPin.coordinate
        }
    }
    
    func createPins() {
        let msu = CLLocationCoordinate2DMake(42.7243337, -84.4923772)
        msuPin = MKPointAnnotation()
        msuPin.coordinate = msu
        msuPin.title = "MSU"
        
        let hometown = CLLocationCoordinate2DMake(-25.4735804, -49.2891083)
        hometownPin = MKPointAnnotation()
        hometownPin.coordinate = hometown
        hometownPin.title = "Hometown"
        
        let favoritePlace = CLLocationCoordinate2DMake(40.6836001, -74.101221)
        favoritePlacePin = MKPointAnnotation()
        favoritePlacePin.coordinate = favoritePlace
        favoritePlacePin.title = "New York City"
        
        let current = CLLocationCoordinate2DMake(0.0, 0.0)
        currentPin = MKPointAnnotation()
        currentPin.coordinate = current
        currentPin.title = "Current Location"
        
        mapView.addAnnotation(msuPin)
        mapView.addAnnotation(hometownPin)
        mapView.addAnnotation(favoritePlacePin)
    }
    
    @IBAction func switchTrackUserChanged(sender: UISwitch) {
        mapView.showsUserLocation = sender.on

        if sender.on {
            locationManager.startUpdatingLocation()
        } else {
            locationManager.stopUpdatingLocation()
        }
    }

    @IBAction func centerAtMsu(sender: UIBarButtonItem) {
        mapView.centerCoordinate = msuPin.coordinate
    }
    
    @IBAction func centerInNewYork(sender: UIBarButtonItem) {
        mapView.centerCoordinate = favoritePlacePin.coordinate
    }
    
    @IBAction func centerInHometown(sender: UIBarButtonItem) {
        mapView.centerCoordinate = hometownPin.coordinate
    }
    
    func mapView(mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        touched = true
    }
    
    func mapView(mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        touched = false
    }
}

