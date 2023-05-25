//
//  PlacesView.swift
//  nano2
//
//  Created by Febrian Daniel on 19/05/23.
//

import SwiftUI

struct PlacesView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 15){
                PlacesCard()
            }
            .padding()
        }
    }
    
//    @ViewBuilder
//    func PlacesList ()->some View {
//        VStack(spacing: 25){
//            ForEach(0..<5) { _ in
//                PlacesCard()
//            }
//            Spacer()
//        }
//    }
}

struct PlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesView()
    }
}
