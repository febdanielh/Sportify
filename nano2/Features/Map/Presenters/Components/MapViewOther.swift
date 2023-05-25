//
//  MapViewOther.swift
//  nano2
//
//  Created by Febrian Daniel on 23/05/23.
//

import SwiftUI
import MapKit

struct MapViewOther: View {
    let userLocation = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194) // User's location
    let otherUserLocation = CLLocationCoordinate2D(latitude: 37.3352, longitude: -122.0096) // Other user's location // Example location
    let anotherUserLocation = CLLocationCoordinate2D(latitude: 37.4412, longitude: -122.0196)
    
    var body: some View {
        MapViewOthers(userLocation: userLocation, otherUserLocation: otherUserLocation, anotherUserLocation: anotherUserLocation)
    }
}

struct MapViewOther_Previews: PreviewProvider {
    static var previews: some View {
        MapViewOther()
    }
}

struct MapViewOthers: UIViewRepresentable {
    let userLocation: CLLocationCoordinate2D
    let otherUserLocation: CLLocationCoordinate2D
    let anotherUserLocation: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.showsUserLocation = true // Show the user's location
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        view.removeAnnotations(view.annotations) // Remove existing annotations
        
        // Add user's location annotation
        let userAnnotation = MKPointAnnotation()
        userAnnotation.coordinate = userLocation
        userAnnotation.title = "You"
        view.addAnnotation(userAnnotation)
        
        // Add other user's location annotation
        let otherUserAnnotation = MKPointAnnotation()
        otherUserAnnotation.coordinate = otherUserLocation
        otherUserAnnotation.title = "Other User"
        view.addAnnotation(otherUserAnnotation)
        
        let anotherUserAnnotation = MKPointAnnotation()
        anotherUserAnnotation.coordinate = anotherUserLocation
        anotherUserAnnotation.title = "Another User"
        view.addAnnotation(anotherUserAnnotation)
        
        // Calculate the midpoint between user's location and other user's location
        let midpoint = midpointCoordinate(userLocation, otherUserLocation)
        
        // Set the visible region to include both annotations and midpoint
        let span = MKCoordinateSpan(latitudeDelta: abs(userLocation.latitude - otherUserLocation.latitude) * 1.2, longitudeDelta: abs(userLocation.longitude - otherUserLocation.longitude) * 1.2)
        let region = MKCoordinateRegion(center: midpoint, span: span)
        view.setRegion(view.regionThatFits(region), animated: true)
    }
    
    func midpointCoordinate(_ coordinate1: CLLocationCoordinate2D, _ coordinate2: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        let lat = (coordinate1.latitude + coordinate2.latitude) / 2
        let lon = (coordinate1.longitude + coordinate2.longitude) / 2
        return CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
}
