//
//  WelcomeView.swift
//  nano2
//
//  Created by Febrian Daniel on 24/05/23.
//

import SwiftUI

struct WelcomeView: View {
    
    @Binding var username: String
    @Binding var description: String
    @Binding var currentDisplayScreen: DisplayScreen
    
    @State private var name: String = ""
    @State private var deskripsi: String = ""
    
    @Binding var selectedInterests: [String]
    @Binding var unSelectedInterests: [String]
    
    @Binding var futsalSelected: Bool
    @Binding var badmintonSelected: Bool
    @Binding var caturSelected: Bool
    @Binding var minSocSelected: Bool
    @Binding var basketSelected: Bool
    @Binding var billiardSelected: Bool
    
    var body: some View {
        ZStack {
            Color.primaryColor
                .ignoresSafeArea()
            ScrollView(.vertical) {
                VStack(spacing: 10) {
                    Image("icon")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .shadow(radius: 7)
                        .padding(.top)
                    
                    Text("Sportify")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("connecting people through sports")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("What's your name?")
                            .font(.title2).bold()
                        TextField("Display Name", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
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
                        
                        Text("Description")
                            .font(.title2).bold()
                        TextField("Description", text: $deskripsi)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(.top)
                    .padding()
                    
                    Spacer().frame(height: 60)
                    Button("Start Linking!"){
                        username = name
                        description = deskripsi
                        self.currentDisplayScreen = .viewIsi
                    }
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                    .frame(width: 156, height: 47)
                    .background(.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(username: .constant(""),
                    description: .constant(""),
                    currentDisplayScreen: .constant(.viewDepan),
                    selectedInterests: .constant([]),
                    unSelectedInterests: .constant([]),
                    futsalSelected: .constant(true),
                    badmintonSelected: .constant(true),
                    caturSelected: .constant(true),
                    minSocSelected: .constant(true),
                    basketSelected: .constant(true),
                    billiardSelected: .constant(true)
        )
    }
}
