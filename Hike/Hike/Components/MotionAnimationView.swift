//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Lucas de Castro Souza on 17/07/23.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var isAnimating: Bool = false
    let numberOfElements: Int = Int.random(in: 6...12)
    
    var body: some View {
        ZStack {
            ForEach(0...numberOfElements, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x: randomCoordinate(),
                        y: randomCoordinate()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ) {
                            isAnimating = true
                        }
                    })
            }
        }
        .frame(width: 256, height: 256)
        .mask(Circle()) // will avoid circles going outside component area
        .drawingGroup() // will boost the performance of complex animations drawing it in a offscreen before displaying it
    }
    
    // MARK: - Private Functions
    
    private func randomCoordinate() -> CGFloat {
        CGFloat.random(in: 0...256)
    }
    
    private func randomSize() -> CGFloat {
        CGFloat(Int.random(in: 4...80))
    }
    
    private func randomScale() -> CGFloat {
        CGFloat(Double.random(in: 0.1...2.0))
    }
    
    private func randomSpeed() -> Double {
        Double.random(in: 0.1...1.0)
    }
    
    private func randomDelay() -> Double {
        Double.random(in: 0...1)
    }

}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.blue)
                .ignoresSafeArea()
            MotionAnimationView()
                .background(
                    Circle()
                        .fill(.teal)
                )
        }
    }
}
