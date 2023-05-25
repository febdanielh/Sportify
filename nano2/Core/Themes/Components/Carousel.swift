//
//  Carousel.swift
//  nano2
//
//  Created by Febrian Daniel on 21/05/23.
//

import SwiftUI

//struct Carousel: View {
//
//    //    let carouselContent: [any View]
//    @State private var currentIndex = 0
//
//    var myTypes: [Any] = [PeopleView.self, PlacesView.self, MeView.self]
//
//
//    var body: some View {
//        ZStack(alignment: .bottom) {
//            IndicatorView(numberOfIndicators: 3, currentIndex: currentIndex, indicatorColor: .gray, indicatorSize: 5)
//                .padding()
//                .zIndex(2)
//                .offset(y: 25)
//            TabView(selection: $currentIndex) {
//                ForEach((0..<myTypes.count), id: \.self) { index in
//                    ScrollView(.vertical,showsIndicators: true) {
//                        self.buildView(types: self.myTypes, index: index)
//                    }
//                    .padding()
//                }
//            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//            .fixedSize(horizontal: false, vertical: false)
//
//
////            .background(
////                RoundedRectangle(cornerRadius: 12, style: .continuous)
////                    .strokeBorder(Color(uiColor: .systemGray5), lineWidth: 1)
////            )
//        }
//    }
//
//    func buildView(types: [Any], index: Int) -> AnyView {
//        switch types[index].self {
//        case is PeopleView.Type: return AnyView( PeopleView() )
//        case is PlacesView.Type: return AnyView( PlacesView() )
//        case is MeView.Type: return AnyView( MeView() )
//        default: return AnyView(EmptyView())
//        }
//    }
//
//}
//
//struct Carousel_Previews: PreviewProvider {
//    static var previews: some View {
//        Carousel()
//    }
//}
