//
//  BeaconAdvertiser.swift
//  nano2
//
//  Created by Febrian Daniel on 23/05/23.
//

import Foundation
import CoreBluetooth
import CoreLocation

class BeaconAdvertiser: NSObject, CBPeripheralManagerDelegate {
    var peripheralManager: CBPeripheralManager?
    
    override init() {
        super.init()
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
    }
    
    func startAdvertisingBeacon() {
        let uuid = UUID(uuidString: "8609D8EF-A136-4880-B561-CA22FC269C09")
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid!, major: 1, minor: 1, identifier: "YourBeacon")
        
        let beaconData = beaconRegion.peripheralData(withMeasuredPower: nil)
        peripheralManager?.startAdvertising(beaconData as? [String: Any])
    }
    
    func stopAdvertisingBeacon() {
        peripheralManager?.stopAdvertising()
    }
    
    // CBPeripheralManagerDelegate methods
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if peripheral.state == .poweredOn {
            startAdvertisingBeacon()
        } else {
            stopAdvertisingBeacon()
        }
    }
}
