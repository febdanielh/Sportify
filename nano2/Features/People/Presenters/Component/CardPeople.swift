//
//  CardPeople.swift
//  nano2
//
//  Created by Febrian Daniel on 19/05/23.
//

import SwiftUI
import UserNotifications

struct CardPeople: View {
    var body: some View {
        VStack(spacing: 10) {
            ForEach(PeopleData.peeps, id: \.self) { people in
                ZStack {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(Color.thirdColor)
                        .frame(width: 361, height: 80)
                        .shadow(radius: 10)
                    HStack{
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 40, height: 40)
                        Spacer()
                            .frame(width: 20)
                        VStack(alignment: .leading) {
                            Text(people.displayName)
                                .bold()
                            Text(people.descriptions)
                        }
                        Spacer()
                        Button{
                            scheduleNotification()
                        } label: {
                            Image(systemName: "person.crop.circle.fill.badge.plus")
                                .resizable()
                                .frame(width: 40, height: 34)
                                .shadow(radius: 5)
                                .foregroundColor(Color.secondaryColor)
                        }
                    }
                    .padding()
                    .frame(width: 361)
                }
            }
        }
    }
}

struct CardPeople_Previews: PreviewProvider {
    static var previews: some View {
        CardPeople()
    }
}
