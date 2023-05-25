//
//  DetectBeacon.swift
//  nano2
//
//  Created by Febrian Daniel on 23/05/23.
//

import Foundation
import CoreLocation

class BeaconDetector: NSObject, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        
        // Request authorization for location services
        locationManager.requestWhenInUseAuthorization()
        
        // Set the delegate to self
        locationManager.delegate = self
        
        // Start ranging for beacons
        startRangingBeacons()
    }
    
    func startRangingBeacons() {
        // Check if ranging is available
        if CLLocationManager.isRangingAvailable() {
            let beaconRegion = CLBeaconRegion(uuid: UUID(uuidString: "8609D8EF-A136-4880-B561-CA22FC269C09")!, identifier: "YourBeacon")
            
            // Start ranging for the beacon region
            locationManager.startRangingBeacons(in: beaconRegion)
        }
    }
    
    func stopRangingBeacons() {
        // Stop ranging for beacons
        let beaconRegion = CLBeaconRegion(uuid: UUID(uuidString: "8609D8EF-A136-4880-B561-CA22FC269C09")!, identifier: "YourBeacon")
        locationManager.stopRangingBeacons(in: beaconRegion)
    }
    
    // CLLocationManagerDelegate methods
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        // Process the detected beacons
        for beacon in beacons {
            print("Detected Beacon: \(beacon)")
        }
    }
}
