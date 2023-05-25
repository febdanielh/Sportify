//
//  MeView.swift
//  nano2
//
//  Created by Febrian Daniel on 19/05/23.
//

import SwiftUI

struct MeView: View {
    
    //    @Binding var currentDisplayScreen: DisplayScreen
    
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
    
    @State private var namaDisplay = ""
    @State private var desc = ""
    
    @Binding var buttonClikced: Bool
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20){
                Text("Me")
                    .foregroundColor(.black)
                    .font(.title)
                    .bold()
                    .padding(.top)
                
                Divider()
                    .padding(.bottom)
                
                Text("Display Name")
                    .font(.title2).bold()
                TextField(username, text: $namaDisplay)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                //            Spacer()
                //                .frame(height: 25)
                
                Text("Interests")
                    .font(.title2).bold()
                Interests(selectedInterests: $selectedInterests,
                          unSelectedInterests: $unSelectedInterests,
                          futsalSelected: $futsalSelected,
                          badmintonSelected: $badmintonSelected,
                          caturSelected: $caturSelected,
                          minSocSelected: $minSocSelected,
                          basketSelected: $basketSelected,
                          billiardSelected: $billiardSelected)
                
                //            Spacer()
                //                .frame(height: 25)
                Text("Description")
                    .font(.title2).bold()
                TextField(description, text: $desc)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Spacer()
                    .frame(height: 25)
            }
            .padding()
            
            Button("Save"){
                buttonClikced.toggle()
                username = namaDisplay
                description = desc
            }
            .font(.title2).bold()
            .foregroundColor(.white)
            .frame(width: 120, height: 60)
            .background(Color.secondaryColor)
            .cornerRadius(10)
            .padding(.top)
        }
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView(selectedInterests: .constant([]),
               unSelectedInterests: .constant([]),
               futsalSelected: .constant(true),
               badmintonSelected: .constant(true),
               caturSelected: .constant(true),
               minSocSelected: .constant(true),
               basketSelected: .constant(true),
               billiardSelected: .constant(true),
               username: .constant(""),
               description: .constant(""),
               buttonClikced: .constant(false)
        )
    }
}
