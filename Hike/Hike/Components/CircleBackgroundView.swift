//
//  CircleBackgroundView.swift
//  Hike
//
//  Created by Lucas de Castro Souza on 13/07/23.
//

import SwiftUI

struct CircleBackgroundView: View {
    @State private var isAnimatingGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            .customIndigoMedium,
                            .customSalmonLight
                        ],
                        startPoint: isAnimatingGradient ? .topLeading : .bottomLeading,
                        endPoint: isAnimatingGradient ? .bottomTrailing : .topTrailing
                    ))
        }
        .frame(width: 256, height: 256)
        .onAppear(perform: {
            withAnimation(.linear(duration: 3).repeatForever(autoreverses: true)) {
                isAnimatingGradient.toggle()
            }
        })
    }
}

struct CircleBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        CircleBackgroundView()
    }
}
