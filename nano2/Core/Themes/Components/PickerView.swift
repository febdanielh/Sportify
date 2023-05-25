//
//  PickerView.swift
//  nano2
//
//  Created by Febrian Daniel on 25/05/23.
//

import SwiftUI
import MapKit
import CoreLocation
import UserNotifications


struct PickerView: View {
    
    @Binding var currentDisplayScreen: DisplayScreen
    
    @State private var detent = PresentationDetent.medium
    @State private var detents: [PresentationDetent] = [.medium, .large, .fraction(0.1)]
    
    @State private var selectedDetent: PresentationDetent = .fraction(0.1)
    
    private var detentss: Set<PresentationDetent> {
        return Set(detents)
    }
    private let allDetents: [PresentationDetent] = [.fraction(0.1), .medium, .large]
    
    @StateObject var mapViewModel = MapViewModel()
    
    @State var anotherSheet = false
    
    @Binding var selectedInterests: [String]
    @Binding var unSelectedInterests: [String]
    
    @Binding var futsalSelected: Bool
    @Binding var badmintonSelected: Bool
    @Binding var caturSelected: Bool
    @Binding var minSocSelected: Bool
    @Binding var basketSelected: Bool
    @Binding var billiardSelected: Bool
    
    @Binding var username: String
    @Binding var description: String
    
    @Binding var buttonClicked: Bool
    
    @State private var currentPage = 1
    
    let spanSet1 = MKCoordinateSpan(latitudeDelta: 0.0001, longitudeDelta: 0.0001)
    let spanSet2 = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    
    var currentSpan: MKCoordinateSpan {
        currentPage == 1 ? spanSet1 : spanSet2
    }
    
    var body: some View {
        MapView(span: currentSpan)
            .ignoresSafeArea()
            .overlay(alignment: .topTrailing, content: {
                Button {
                    anotherSheet.toggle()
                } label: {
                    Image(systemName: "gearshape.fill")
                        .font(.title)
                        .shadow(radius: 5)
                }
                .offset(y: 50)
                .padding()
            })
            .sheet(isPresented: .constant(true), content: {
                
                ScrollView(.vertical) {
                    Picker("Segment", selection: $currentPage) {
                        Text("People").tag(1)
                        Text("Places").tag(2)
                    }
                    .presentationDetents(detentss)
                    .interactiveDismissDisabled(true)
                    .presentationBackgroundInteraction(.enabled)
                    .pickerStyle(.segmented)
                    .padding()
                    .padding(.top)
                    
                    switch currentPage {
                        
                    case 1:
                        PeopleView(selectedInterests: $selectedInterests)
                    case 2:
                        PlacesView()
                    default:
                        PeopleView(selectedInterests: $selectedInterests)
                    }
                }
                .sheet(isPresented: $anotherSheet) {
                    ScrollView(.vertical) {
                        MeView(selectedInterests: $selectedInterests,
                               unSelectedInterests: $unSelectedInterests,
                               futsalSelected: $futsalSelected,
                               badmintonSelected: $badmintonSelected,
                               caturSelected: $caturSelected,
                               minSocSelected: $minSocSelected,
                               basketSelected: $basketSelected,
                               billiardSelected: $billiardSelected,
                               username: $username,
                               description: $description,
                               buttonClikced: $buttonClicked)
                    }
                    .onChange(of: buttonClicked) { newValue in
                        anotherSheet = false
                    }
                }
                
                //                ScrollView {
                //                    UpsideTab(selectedDetent: $selectedDetent, allDetents: allDetents)
                //                        .presentationDetents(detentss)
                //                        .interactiveDismissDisabled(true)
                //                        .presentationBackgroundInteraction(PresentationBackgroundInteraction.enabled)
                //                }
            })
        //            .preferredColorScheme(.light)
        //        TabView {
        //            MapView()
        //                .tabItem {
        //                    Label("People", systemImage: "figure.badminton")
        //                }
        //                .toolbarBackground(.visible, for: .tabBar)
        //                .toolbarBackground(.ultraThickcMaterial, for: .tabBar)
        //
        //            MapView()
        //                .tabItem {
        //                    Label("Places", systemImage: "sportscourt.fill")
        //                }
        //                .toolbarBackground(.visible, for: .tabBar)
        //                .toolbarBackground(.ultraThickMaterial, for: .tabBar)
        //
        //            MapView()
        //                .tabItem {
        //                    Label("Me", systemImage: "person.circle.fill")
        //                }
        //                .toolbarBackground(.visible, for: .tabBar)
        //                .toolbarBackground(.ultraThickMaterial, for: .tabBar)
        //        }
        //    }
        
        //        @ViewBuilder
        //        func CustomBottomSHeet() -> some View{
        //            ZStack{
        //                Rectangle()
        //                    .fill(.ultraThickMaterial)
        //            }
        //            .frame(height: 70)
        //            .overlay(alignment: .bottom, content: {
        //                Rectangle()
        //                    .fill(Color.gray.opacity(0.1))
        //                    .frame(height: 1)
        //            })
        //            .offset(y: -49)
        //        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(currentDisplayScreen: .constant(.viewIsi),
                   selectedInterests: .constant(["Badminton", "Futsal"]),
                   unSelectedInterests: .constant(["Mini Soccer"]),
                   futsalSelected: .constant(true),
                   badmintonSelected: .constant(true),
                   caturSelected: .constant(true),
                   minSocSelected: .constant(true),
                   basketSelected: .constant(true),
                   billiardSelected: .constant(true),
                   username: .constant(""),
                   description: .constant(""),
                   buttonClicked: .constant(false)
        )
    }
}



