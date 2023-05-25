//
//  Map.swift
//  nano2
//
//  Created by Febrian Daniel on 19/05/23.
//

import MapKit
import CoreLocation
import SwiftUI

struct MapView: View {
    
    @StateObject private var viewModel = MapViewModel()
    @State private var annotations: [MKPointAnnotation] = []
    @State private var region = MKCoordinateRegion()
    
    let manuallyAddedLocations: [CLLocationCoordinate2D] = [
            CLLocationCoordinate2D(latitude: -6.302123971371539, longitude: 106.6524851055746),
            CLLocationCoordinate2D(latitude: -6.3021675615035795, longitude: 106.65248243789878),
            CLLocationCoordinate2D(latitude: -6.302144234004394, longitude: 106.65254412869942),
            CLLocationCoordinate2D(latitude: -6.272135250151961, longitude: 106.66967451351304),
            CLLocationCoordinate2D(latitude: -6.293108927637489, longitude: 106.66806163584326),
            CLLocationCoordinate2D(latitude: -6.252938346831773, longitude: 106.66799333276231),
            CLLocationCoordinate2D(latitude: -6.263540657899131, longitude: 106.62648082732683),
            CLLocationCoordinate2D(latitude: -6.223741750134653, longitude: 106.6374069202246)
        ]

        let manuallyAddedTitles = ["Anjai", "Bro", "Sis", "Candra Wijaya Badminton Centre", "MS Indoor Serpong", "Stadiums Futsal", "BIFO Arena", "Aim High Stadium"]
    
    let span: MKCoordinateSpan
    
    var coordinateArray: [CLLocationCoordinate2D] {
            viewModel.locations.map { $0.coordinate }
        }
    
    var body: some View {
        
        MapViewOtherss(annotations: createAnnotationsForLocations(manuallyAddedLocations, titles: manuallyAddedTitles, userLocation: coordinateArray.first), span: span)
            .onAppear {
                viewModel.checkUserLocationEnabled()
            }
            .onReceive(viewModel.$locations) { locations in
                guard let userLocation = locations.first else { return }
                
                // Update user's location annotation
                let userAnnotation = MKPointAnnotation()
                userAnnotation.coordinate = userLocation.coordinate
                userAnnotation.title = "You"
                
                // Update other users' locations
//                let otherUsersLocations = Array(locations.dropFirst())
//                let otherUsersAnnotations = otherUsersLocations.map { location -> MKPointAnnotation in
//                    let annotation = MKPointAnnotation()
//                    annotation.coordinate = location.coordinate
//                    annotation.title = "Other User"
//                    return annotation
//                }
//
                // Update map annotations and region
                let allAnnotations = [userAnnotation]
                let region = MKCoordinateRegion(center: userLocation.coordinate, span: span)
                
                //  Calculate the midpoint between user's location and other user's location
                //                if let midpoint = calculateMidpoint(locations: locations){
                //                    let region = MKCoordinateRegion(center: midpoint, span: MKCoordinateSpan(
                //                        latitudeDelta: 0.001,
                //                        longitudeDelta: 0.001)
                //                    )
                
                //                }
                // Update the state variables
                self.annotations = allAnnotations
                self.region = region
            }
        //        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
        //            .accentColor(Color(.blue))
        //            .onAppear {
        //                viewModel.checkUserLocationEnabled()
        //            }
        //            .ignoresSafeArea()
    }
    
    func calculateMidpoint(locations: [CLLocation]) -> CLLocationCoordinate2D? {
        guard locations.count > 1 else { return nil }
        
        let coordinates = locations.map { $0.coordinate }
        let latitudes = coordinates.map { $0.latitude }
        let longitudes = coordinates.map { $0.longitude }
        
        let sumLatitudes = latitudes.reduce(0, +)
        let sumLongitudes = longitudes.reduce(0, +)
        
        let midpointLatitude = sumLatitudes / Double(locations.count)
        let midpointLongitude = sumLongitudes / Double(locations.count)
        
        return CLLocationCoordinate2D(latitude: midpointLatitude, longitude: midpointLongitude)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        
        MapView(span: MKCoordinateSpan(
            latitudeDelta: 0.001,
            longitudeDelta: 0.001))
        //                .bottomSheet(presentationDetents: [.medium, .large, .height(50)], isPresented: .constant(true), sheetCornerRadius: 20, presentationInteractionEnabled: .enabled(upThrough: .medium)){
        //                    ScrollView(.vertical, showsIndicators: false){
        //
        //                    }
        //                    .background(content: {
        //                        Rectangle()
        //                            .fill(.white)
        //                            .ignoresSafeArea()
        //                    })
        //                } onDismiss: {}
    }
}

struct MapViewOtherss: UIViewRepresentable {
    
    typealias UIViewType = MKMapView
    
    let annotations: [MKPointAnnotation]
    
    let span: MKCoordinateSpan
    
//    @Binding var region: MKCoordinateRegion
    
    func makeUIView(context: Context) -> MKMapView {
        
        let mapView = MKMapView()
//        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
//        mapView.setRegion(region, animated: true)
        return mapView
    }
    
    //    func updateUIView(_ view: MKMapView, context: Context) {
    //        view.removeAnnotations(view.annotations) // Remove existing annotations
    //
    //        // Add user's location annotation
    //        let userAnnotation = MKPointAnnotation()
    //        userAnnotation.coordinate = userLocation
    //        userAnnotation.title = "You"
    //        view.addAnnotation(userAnnotation)
    //
    //        // Add other user's location annotation
    //        let otherUserAnnotation = MKPointAnnotation()
    //        otherUserAnnotation.coordinate = otherUserLocation
    //        otherUserAnnotation.title = "Other User"
    //        view.addAnnotation(otherUserAnnotation)
    //
    
    //
    //        // Set the visible region to include both annotations and midpoint
    //        let span = MKCoordinateSpan(latitudeDelta: abs(userLocation.latitude - otherUserLocation.latitude) * 1.2, longitudeDelta: abs(userLocation.longitude - otherUserLocation.longitude) * 1.2)
    //        let region = MKCoordinateRegion(center: midpoint, span: span)
    //        view.setRegion(view.regionThatFits(region), animated: true)
    //    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
      
        view.removeAnnotations(view.annotations)
        view.addAnnotations(annotations)
        view.showAnnotations(annotations, animated: true)
        view.setRegion(MKCoordinateRegion(center: annotations.first?.coordinate ?? CLLocationCoordinate2D(), span: span), animated: true)
        
//        view.setRegion(view.regionThatFits(region), animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        let parent: MapViewOtherss

        init(_ parent: MapViewOtherss) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
            annotationView.canShowCallout = true
            return annotationView
        }
    }
    //    func midpointCoordinate(_ coordinate1: CLLocationCoordinate2D, _ coordinate2: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
    //        let lat = (coordinate1.latitude + coordinate2.latitude) / 2
    //        let lon = (coordinate1.longitude + coordinate2.longitude) / 2
    //        return CLLocationCoordinate2D(latitude: lat, longitude: lon)
    //    }
}

func createAnnotationsForLocations(_ locations: [CLLocationCoordinate2D], titles: [String], userLocation: CLLocationCoordinate2D?) -> [MKPointAnnotation] {
    var annotations: [MKPointAnnotation] = []

    // Add user's location if available
    if let userLocation = userLocation {
        let userAnnotation = MKPointAnnotation()
        userAnnotation.title = "You"
        userAnnotation.coordinate = userLocation
        annotations.append(userAnnotation)
    }

    for i in 0..<min(locations.count, titles.count) {
        let annotation = MKPointAnnotation()
        annotation.title = titles[i]
        annotation.coordinate = locations[i]
        annotations.append(annotation)
    }

    return annotations
}

