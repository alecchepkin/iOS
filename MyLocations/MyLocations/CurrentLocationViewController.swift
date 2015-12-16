//
//  FirstViewController.swift
//  MyLocations
//
//  Created by legr on 15/12/15.
//  Copyright © 2015 legr. All rights reserved.
//
import CoreLocation
import UIKit

class CurrentLocationViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var tagButton: UIButton!
    @IBOutlet weak var getButton: UIButton!
    
    let locationManager = CLLocationManager()
    
    var location: CLLocation?
    
    var updatingLocation = false
    var lastLocationError: NSError?
    
    let geocoder = CLGeocoder()
    var placemark: CLPlacemark?
    var performingReverseGeocoding = false
    var lastGeocodingError: NSError?
    
    @IBAction func getLocation() {
        
        let authStatus = CLLocationManager.authorizationStatus()
        
        if authStatus == .NotDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        
        if authStatus == .Denied || authStatus == .Restricted {
            showLocationServicesDeniedAlert()
        }
        
        if updatingLocation {
            stopLocationManager()
        } else {
            location = nil
            lastLocationError = nil
            placemark = nil
            lastGeocodingError = nil
            startLocationManager()
        }
        updateLabels()
        configureGetButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
        configureGetButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("didFailWithError \(error)")
        
        if error.code == CLError.LocationUnknown.rawValue {
            return
        }
        lastLocationError = error
        
        stopLocationManager();
        updateLabels()
        configureGetButton()
        
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last!
        print("didUpdateLocations \(newLocation)")
        // 1
        if newLocation.timestamp.timeIntervalSinceNow < -5 {
        return
        }
        // 2
        if newLocation.horizontalAccuracy < 0 {
        return
        }
        // 3
        if location == nil ||
        location!.horizontalAccuracy > newLocation.horizontalAccuracy {
            // 4
            lastLocationError = nil
            location = newLocation
            updateLabels()
            // 5
            if newLocation.horizontalAccuracy <=
            locationManager.desiredAccuracy {
                print("*** We're done!")
                stopLocationManager()
                configureGetButton()
            }
        
            // The new code begins here:
            if performingReverseGeocoding == false {
                print("*** Going to geocode")
                performingReverseGeocoding = true
                geocoder.reverseGeocodeLocation(
                    newLocation,
                    completionHandler: {
                        placemarks, error in print("*** Found placemarks: \(placemarks), error: \(error)")
                        self.lastGeocodingError = error
                        if error == nil, let p = placemarks where !p.isEmpty {
                            self.placemark = p.last!
                        } else {
                            self.placemark = nil
                        }
                        self.performingReverseGeocoding = false
                        self.updateLabels()
                })
            }
        }
        
    }
    
    func updateLabels() {
        if let location = location {
            latitudeLabel.text = String(format: "%.8f", location.coordinate.latitude)
            longitudeLabel.text = String(format: "%.8f", location.coordinate.longitude)
            addressLabel.text = ""
            messageLabel.text = ""
            tagButton.hidden = false
            
            if let placemark = placemark {
                addressLabel.text = stringFromPlacemark(placemark)
            } else if performingReverseGeocoding {
                addressLabel.text = "Searching for Address..."
            } else if lastGeocodingError != nil {
                addressLabel.text = "Error Finding Address"
            } else {
                addressLabel.text = "No Address Found"
            }
            
            
        } else {
            latitudeLabel.text = ""
            longitudeLabel.text = ""
            addressLabel.text = ""
            messageLabel.text = "Tap 'Get My Location' to Start"
            tagButton.hidden = true
            
            let statusMessage: String
            if let error = lastLocationError {
                if error.domain == kCLErrorDomain &&
            error.code == CLError.Denied.rawValue {
                statusMessage = "Location Services Disabled"
                } else {
            statusMessage = "Error Getting Location"
                }
            } else if CLLocationManager.locationServicesEnabled() == false {
                statusMessage = "Location Services Disabled"
            } else if updatingLocation {
                statusMessage = "Searching ..."
            } else {
                statusMessage = "Tap 'Get My Location' to Start"
            }
            messageLabel.text = statusMessage
            }
    }
    
    func stringFromPlacemark(placemark: CLPlacemark) -> String {
        // 1
        var line1 = ""
        // 2
        if let s = placemark.subThoroughfare {
        line1 += s + " "
        }
        // 3
        if let s = placemark.thoroughfare {
        line1 += s
        }
        // 4
        var line2 = ""
        if let s = placemark.locality {
        line2 += s + " "
        }
        if let s = placemark.administrativeArea {
        line2 += s + " "
        }
        if let s = placemark.postalCode {
        line2 += s
        }
        
        print("stringFromPlacemark:\(line1 + "\n" + line2)")
        // 5
        return line1 + "\n" + line2
    }
    
    func configureGetButton() {
                if updatingLocation {
                getButton.setTitle("Stop", forState: .Normal)
            } else {
                getButton.setTitle("Get My Location", forState: .Normal)
                }
    }
    
    func stopLocationManager() {
            if updatingLocation {
        locationManager.delegate = nil
        locationManager.stopUpdatingLocation()
        updatingLocation = false
            }
    }
    func startLocationManager() {
                if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                locationManager.startUpdatingLocation()
                updatingLocation = true
                }
    }
    
    func showLocationServicesDeniedAlert(){
                let alert = UIAlertController(title: "Location Services Disabled", message: "Please enable location services for this app in Settings.", preferredStyle: .Alert)
                let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alert.addAction(okAction)
                presentViewController(alert, animated: true, completion: nil)
    }
    
    
}

