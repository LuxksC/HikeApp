//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Lucas de Castro Souza on 12/07/23.
//

import Foundation
import SwiftUI

struct GradientStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                configuration.isPressed ?
                LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .bottom, endPoint: .top)
                :
                LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(40)
    }
}
