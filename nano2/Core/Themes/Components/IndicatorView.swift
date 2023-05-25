//
//  IndicatorView.swift
//  nano2
//
//  Created by Febrian Daniel on 21/05/23.
//

import SwiftUI

struct IndicatorView: View {
    
    let numberOfIndicators: Int
    let currentIndex: Int
    let indicatorColor: Color
    var indicatorSize: CGFloat = 8
    
    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<numberOfIndicators, id: \.self) { index in
                Circle()
                    .fill(index == currentIndex ? indicatorColor : Color(.systemGray4))
                    .frame(width: indicatorSize, height: indicatorSize)
                    .animation(.spring(), value: currentIndex == index )
            }
        }
    }
}

struct IndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorView(numberOfIndicators: 3, currentIndex: 0, indicatorColor: .gray)
    }
}
