//
//  Interests.swift
//  nano2
//
//  Created by Febrian Daniel on 24/05/23.
//

import SwiftUI

struct Interests: View {
    
    @Binding var selectedInterests: [String]
    @Binding var unSelectedInterests: [String]
    
    @Binding var futsalSelected: Bool
    @Binding var badmintonSelected: Bool
    @Binding var caturSelected: Bool
    @Binding var minSocSelected: Bool
    @Binding var basketSelected: Bool
    @Binding var billiardSelected: Bool
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Button(action: {
                    futsalSelected.toggle()
                    if !selectedInterests.contains("Futsal") && futsalSelected == true {
                        selectedInterests.append("Futsal")
                    }
                    else if  !selectedInterests.contains("Futsal") && futsalSelected == false {
                        unSelectedInterests.append("Futsal")
                    }
                }) {
                    ButtonView(selected: $futsalSelected, title: "Futsal")
                }
                
                Button(action: {
                    badmintonSelected.toggle()
                    if !selectedInterests.contains("Badminton") && badmintonSelected == true {
                        selectedInterests.append("Badminton")
                    }
                    else if  !unSelectedInterests.contains("Badminton") && badmintonSelected == false {
                        unSelectedInterests.append("Badminton")
                    }
                }) {
                    ButtonView(selected: $badmintonSelected, title: "Badminton")
                }
                
                Button(action: {
                    caturSelected.toggle()
                    if !selectedInterests.contains("Catur") && caturSelected == true {
                        selectedInterests.append("Catur")
                    }
                    else if  !unSelectedInterests.contains("Catur") && caturSelected == false {
                        unSelectedInterests.append("Catur")
                    }
                }) {
                    ButtonView(selected: $caturSelected, title: "Catur")
                }
            }
            HStack(spacing: 20) {
                Button(action: {
                    minSocSelected.toggle()
                    if !selectedInterests.contains("Mini Soccer") && minSocSelected == true {
                        selectedInterests.append("Mini Soccer")
                    }
                    else if  !unSelectedInterests.contains("Mini Soccer") && minSocSelected == false {
                        unSelectedInterests.append("Mini Soccer")
                    }
                }) {
                    ButtonView(selected: $minSocSelected, title: "Mini Soccer")
                }
                
                Button(action: {
                    basketSelected.toggle()
                    if !selectedInterests.contains("Basket") && basketSelected == true {
                        selectedInterests.append("Basket")
                    }
                    else if  !unSelectedInterests.contains("Basket") && basketSelected == false {
                        unSelectedInterests.append("Basket")
                    }
                }) {
                    ButtonView(selected: $basketSelected, title: "Basket")
                }
                
                Button(action: {
                    billiardSelected.toggle()
                    if !selectedInterests.contains("Billiard") && billiardSelected == true {
                        selectedInterests.append("Billiard")
                    }
                    else if  !unSelectedInterests.contains("Billiard") && billiardSelected == false {
                        unSelectedInterests.append("Billiard")
                    }
                }) {
                    ButtonView(selected: $billiardSelected, title: "Billiard")
                }
            }
        }
    }
}

struct Interests_Previews: PreviewProvider {
    static var previews: some View {
        Interests(selectedInterests: .constant([]),
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

struct ButtonView: View {
    @Binding var selected: Bool
    let title: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .fill(selected ? Color.secondaryColor : Color.white)
                .frame(width: 110, height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 28, style: .continuous)
                        .stroke(selected ? Color.secondaryColor : Color.secondaryColor, style: StrokeStyle(lineWidth: 3)))
            Text(title)
                .fontWeight(.medium)
                .foregroundColor(selected ? Color.white: Color.black)
        }
    }
}
