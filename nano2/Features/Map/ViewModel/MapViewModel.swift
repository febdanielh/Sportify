//
//  yoi.swift
//  nano2
//
//  Created by Febrian Daniel on 19/05/23.
//

import Foundation
import MapKit

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager?
    //    private let locationManager = CLLocationManager()
    
    @Published var segment = 0
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: -6.302174756476227,
            longitude: 106.65254025593404),
        span: MKCoordinateSpan(
            latitudeDelta: 0.001,
            longitudeDelta: 0.001)
    )
    
    @Published var locations: [CLLocation] = []

    func checkUserLocationEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("yoi")
        }
    }
    
    //    override init() {
    //            super.init()
    //            locationManager.delegate = self
    //        }
    //
    //        func requestLocation() {
    //            locationManager.requestWhenInUseAuthorization()
    //            locationManager.startUpdatingLocation()
    //        }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely due to parental control.")
        case .denied:
            print("Your location is denied bro, plis kasih la")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate,
                                        span: MKCoordinateSpan(
                                            latitudeDelta: 0.001,
                                            longitudeDelta: 0.001))
        @unknown default:
            break
        }
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locations = locations
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Handle error
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
}
