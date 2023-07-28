//
//  CardHeaderView.swift
//  Hike
//
//  Created by Lucas de Castro Souza on 12/07/23.
//

import SwiftUI
import UIKit

struct CardHeaderView: View {
    @State private var isShowingSheet: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Hiking")
                    .fontWeight(.black)
                    .font(.system(size: 52))
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
                
                Spacer()
                
                Button {
                    // Some action
                    print("Button pressed")
                    isShowingSheet.toggle()
                    
                } label: {
                    CircleButton(
                        backgroundColors: [
                            .white,
                            .customGreenLight,
                            .customGreenMedium
                        ],
                        icon: "figure.hiking"
                    )
                }
                .sheet(isPresented: $isShowingSheet) {
                    SettingsView()
                        .presentationDragIndicator(.visible) // indicator that shows the possibility of draging the sheet up or down
                        .presentationDetents([.medium, .large]) // defines the positions that sheet will ocupy, medium is half of screen and lare is almost entire screen
                }
            }
            
            Text("Fun and enjoyable outdoor activity for friends and families.")
                .foregroundColor(.customGrayMedium)
                .italic()
        }
    }
}

struct CardHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CardHeaderView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
