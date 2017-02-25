//
//  ViewController.swift
//  TimeToBurn
//
//  Created by Jason Crawford on 2/25/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    var coords = CLLocationCoordinate2D(latitude: 40, longitude: 40)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("DAX: location changed")
        
        if status == .authorizedWhenInUse {
            getLocation()
        } else if status == .denied {
            let alert = UIAlertController(title: "Error", message: "Go to settings and allow this app to access you location!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func getLocation() {
        if let loc = locationManager.location?.coordinate {
            coords = loc 
        }
    }

}







