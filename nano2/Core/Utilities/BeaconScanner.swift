//
//  BeaconScanner.swift
//  nano2
//
//  Created by Febrian Daniel on 23/05/23.
//

import Foundation
import CoreLocation
import CoreBluetooth

class BeaconScanner: NSObject, CBCentralManagerDelegate {
    var centralManager: CBCentralManager!
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func startScanningForBeacons() {
        let uuid = UUID(uuidString: "8609D8EF-A136-4880-B561-CA22FC269C09")
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid!, identifier: "YourBeacon")
        
        centralManager.scanForPeripherals(withServices: [CBUUID(nsuuid: beaconRegion.proximityUUID)])
    }
    
    func stopScanningForBeacons() {
        centralManager.stopScan()
    }
    
    // CBCentralManagerDelegate methods
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            startScanningForBeacons()
        } else {
            stopScanningForBeacons()
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        // Process the discovered beacon
        print("Discovered Beacon: \(peripheral), RSSI: \(RSSI)")
    }
}


