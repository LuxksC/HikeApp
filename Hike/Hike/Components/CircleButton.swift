//
//  CircleButton.swift
//  Hike
//
//  Created by Lucas de Castro Souza on 12/07/23.
//

import SwiftUI

struct CircleButton: View {
    var backgroundColors: [Color]
    var icon: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: backgroundColors,
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            Circle()
                .stroke(
                    LinearGradient(
                        colors: [
                            .customGrayLight,
                            .customGrayMedium
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    lineWidth: 4
                )
            
            Image(systemName: icon)
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .customGrayLight,
                            .customGrayMedium
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
        }
        .frame(width: 58, height: 58)
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton(
            backgroundColors: [
                .white,
                .customGreenLight,
                .customGreenMedium
            ],
            icon: "figure.hiking"
        )
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
