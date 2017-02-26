//
//  ViewController.swift
//  TimeToBurn
//
//  Created by Jason Crawford on 2/25/17.
//  Copyright © 2017 Jason Crawford. All rights reserved.
//

import UIKit
import MapKit
import Alamofire

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var skinTypeLabel: UILabel!
    
    var skinType = SkinType().type1 {
        didSet {
            skinTypeLabel.text = "Skin:" + self.skinType
            Utilities().setSkinType(value: skinType)
        }
    }
    
    var uvIndex = 8
    
    let locationManager = CLLocationManager()
    var coords = CLLocationCoordinate2D(latitude: 40, longitude: 40)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        skinType = Utilities().getSkinType()
        skinTypeLabel.text = "Skin: " + skinType
    }

    @IBAction func changeSkinClicked(_ sender: UIButton) {
        let alert = UIAlertController(title: "Skin Type", message: "Please Choose Skin Type", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: SkinType().type1, style: .default, handler: { (action) in
            self.skinType = SkinType().type1
        }))
        alert.addAction(UIAlertAction(title: SkinType().type2, style: .default, handler: { (action) in
            self.skinType = SkinType().type2
        }))
        alert.addAction(UIAlertAction(title: SkinType().type3, style: .default, handler: { (action) in
            self.skinType = SkinType().type3
        }))
        alert.addAction(UIAlertAction(title: SkinType().type4, style: .default, handler: { (action) in
            self.skinType = SkinType().type4
        }))
        alert.addAction(UIAlertAction(title: SkinType().type5, style: .default, handler: { (action) in
            self.skinType = SkinType().type5
        }))
        alert.addAction(UIAlertAction(title: SkinType().type6, style: .default, handler: { (action) in
            self.skinType = SkinType().type6
        }))
        self.present(alert, animated: true, completion: nil)
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
            getWeatherData()
        }
    }
    
    func getWeatherData() {
        let url = WeatherUrl(lat: String(coords.latitude), long: String(coords.longitude)).getFullUrl()
        print("URL \(url)")
        
        Alamofire.request(url).responseJSON { response in
            print("alamo \(response.result)")
            
            if let JSON = response.result.value as? [String: Any] {
                print("JSON \(JSON)")
                
                if let data = JSON["data"] as? Dictionary<String, AnyObject> {
                    if let weather = data["weather"] as? [Dictionary<String, AnyObject>] {
                        if let uv = weather[0]["uvIndex"] as? String {
                            if let uvI = Int(uv) {
                                self.uvIndex = uvI
                                print("UV Index = \(uvI)")
                            }
                        }
                    }
                }
            }
        }
        
    }

}







