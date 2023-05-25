//
//  PeopleView.swift
//  nano2
//
//  Created by Febrian Daniel on 19/05/23.
//

import SwiftUI

struct PeopleView: View {
    
    @Binding var selectedInterests: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            
            Filter(selectedInterests: $selectedInterests)
            
            CardPeople()
        }
        .padding()
    }
    
//    @ViewBuilder
//    func PeopleList ()->some View {
//        VStack(spacing: 25){
//            ForEach(0..<5) { _ in
//                CardPeople()
//            }
//            Spacer()
//        }
//    }
}

//struct PeopleView_Previews: PreviewProvider {
//    static var previews: some View {
//        PeopleView(selectedInterests: ["Futsal", "Badminton"])
//    }
//}
