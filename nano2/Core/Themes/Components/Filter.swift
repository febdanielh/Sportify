//
//  Filter.swift
//  nano2
//
//  Created by Febrian Daniel on 19/05/23.
//

import SwiftUI

struct Filter: View {
    
    @Binding var selectedInterests: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(selectedInterests, id: \.self){ interest in
                    ZStack {
                        RoundedRectangle(cornerRadius: 28, style: .continuous)
                            .stroke(Color.secondaryColor, style: StrokeStyle.init(lineWidth: 3))
                        .frame(width: 120, height: 50)
                        Text(interest)
                            .fontWeight(.medium)
                    }
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 28, style: .continuous)
//                            .stroke(Color.blue, style: StrokeStyle.init(lineWidth: 3))
//                        .frame(width: 150, height: 50)
//                        Text("Badminton")
//                            .fontWeight(.medium)
//                    }
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 28, style: .continuous)
//                            .stroke(Color.blue, style: StrokeStyle.init(lineWidth: 3))
//                        .frame(width: 120, height: 50)
//                        Text("Futsal")
//                            .fontWeight(.medium)
//                    }
                }
            }
            .padding(.top, 5)
            .padding(.bottom)
        }
        .frame(width: 361)
    }
}

//struct Filter_Previews: PreviewProvider {
//    static var previews: some View {
//        Filter(selectedInterests: .constant([]))
//    }
//}
