//
//  PlacesCard.swift
//  nano2
//
//  Created by Febrian Daniel on 21/05/23.
//

import SwiftUI

struct PlacesCard: View {
    
    var body: some View {
        VStack(spacing: 25) {
            ForEach(PlacesData.places, id: \.self) {place in
                ZStack {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(Color.primaryColor)
                        .frame(width: 361, height: 120)
                        .shadow(radius: 10)
                    HStack{
                        Image(place.image)
                            .resizable()
                            .frame(width: 80, height: 60)
                        Spacer()
                            .frame(width: 20)
                        VStack(alignment: .leading, spacing: 5) {
                            Text(place.placeName)
                                .bold()
                            Text(place.description)
                            Text(place.address)
                        }
//                        .foregroundColor(Color.fourthColor)
                        Spacer()
//                        Image(systemName: "paperplane.fill")
//                            .resizable()
//                            .frame(width: 40, height: 34)
//                            .shadow(radius: 5)
                    }
                    .padding()
                    .frame(width: 361)
                }
            }
        }
    }
}

struct PlacesCard_Previews: PreviewProvider {
    static var previews: some View {
        PlacesCard()
    }
}


