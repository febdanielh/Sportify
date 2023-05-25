//
//  UpsideTab.swift
//  nano2
//
//  Created by Febrian Daniel on 22/05/23.
//

import SwiftUI

//struct UpsideTab: View {
//    
//    enum Menus: String {
//        case people = "People"
//        case places = "Places"
//        case me = "me"
//    }
//    
//    @State var menuAppeared = Menus.people
//    
//    @Binding var selectedDetent: PresentationDetent
//    let allDetents: [PresentationDetent]
//    
//    var body: some View {
//        VStack(spacing: 15){
//            HStack() {
//                Button("People"){
//                    self.menuAppeared = Menus.people
////                    guard let currentIndex = allDetents.firstIndex(of: selectedDetent) else {
////                        return
////                    }
////                    let nextIndex = (currentIndex + 1) % allDetents.count
////                    selectedDetent = .medium
//                }
//                .foregroundColor(.black)
//                .font(.title)
//                .bold()
//                .padding(.top)
//                
//                Spacer()
//                Button("Places"){
//                    self.menuAppeared = Menus.places
//                }
//                .foregroundColor(.black)
//                .font(.title)
//                .bold()
//                .padding(.top)
//                
//                Spacer()
//                
//                Button("Me"){
//                    self.menuAppeared = Menus.me
//                }
//                .foregroundColor(.black)
//                .font(.title)
//                .bold()
//                .padding(.top)
//            }
//            .frame(width: 361)
//            Divider()
//                .padding(.bottom)
//            
//            switch menuAppeared {
//            case .people:
//                PeopleView()
////                    .animation(.easeIn)
//            case .places:
//                PlacesView()
////                    .animation(.easeIn)
//            case .me:
//                MeView()
////                    .animation(.easeIn)
//            }
//        }
//        .padding()
//    }
//}

//struct UpsideTab_Previews: PreviewProvider {
//    static var previews: some View {
//        UpsideTab()
//    }
//}
