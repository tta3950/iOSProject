//
//  MapView.swift
//  Designated Driver
//
//  Created by Alexander,Terry T on 3/29/18.
//  Copyright © 2018 Team M6. All rights reserved.
//

import UIKit
import MapKit

class MapView: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        centerMapAroundLocation(UserModel.instance.userLocation)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func centerMapAroundLocation(_ location:CLLocation){
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 1000, 1000)
        mapView.setRegion(coordinateRegion, animated: true)
    }

}
