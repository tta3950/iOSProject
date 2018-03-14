//
//  ViewController.swift
//  Designated Driver
//
//  Created by Brandt,Jesse R on 3/9/18.
//  Copyright © 2018 Team M6. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var textView: UITextView!
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startReceivingLocationChanges()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func startReceivingLocationChanges() {
        // Get authorization details
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus != .authorizedWhenInUse && authorizationStatus != .authorizedAlways {
            //can't continue because user didn't authorize the location services
            //provide popup in case they forgot
            locationManager.requestWhenInUseAuthorization()
            return
        }
        //start services if it hasn't been yet
        if !CLLocationManager.locationServicesEnabled() {
            //tell users to start the service or provide popup
            
            return
        }
        
        //configure the service
        
        //desired accuracy 100m
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.distanceFilter = 100.0
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        let currentLocation = locationManager.location
        textView.text = locationToString(currentLocation!)

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation = locations.last!
        //display this to the screen
        print("Current Location: \(currentLocation)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("There was an error. \(error)")
    }
    
    func locationToString(_ loc:CLLocation)->String{
        var str = ""
        let coord = loc.coordinate
        str += "Latitude: \(coord.latitude) Longitude: \(coord.longitude)"
        return str
    }

}

