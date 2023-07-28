//
//  SettingsView.swift
//  Hike
//
//  Created by Lucas de Castro Souza on 24/07/23.
//

import SwiftUI

struct SettingsView: View {
    private let alternateAppIcons: [String] = [
        "AppIcon-Backpack",
        "AppIcon-Camera",
        "AppIcon-Campfire",
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom"
    ]
    
    var body: some View {
        List {
            // MARK: - Header
            Section {
                HStack{
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editor's Choice")
                            .fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .customGreenLight,
                            .customGreenMedium,
                            .customGreenDark
                        ],
                        startPoint: .top,
                        endPoint: .bottom)
                )
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("Where can you find\nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hick which looks good in photos but is even better once you are actually there. The hike that you hope to do again someday.\nFind the best hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity) // necessary to center the VStack in the section
            }
            .listRowSeparator(.hidden) // hide row separator above the section
            
            // MARK: - Change Icons
            Section(header: Text("CHANGE APP ICON")) {
                ScrollView(.horizontal) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { index in
                            Button {
                                print("\(alternateAppIcons[index]) Icon pressed")
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[index]) { error in
                                    if let errorDescription = error?.localizedDescription {
                                        print("Failed request to update app's icon: \(errorDescription)")
                                    } else {
                                        print("Success! Now the app's icon is \(alternateAppIcons[index])")
                                    }
                                }
                            } label: {
                                Image("\(alternateAppIcons[index])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 65, height: 65)
                                    .cornerRadius(16)
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                
                Text("Choose your favorite app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
            }
            .listRowSeparator(.hidden)

            
            // MARK: - About
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack {
                    Spacer()
                    Text("Copyright © All right reserved.") // to write the symbol © just tap (Option + G)
                    Spacer()
                }
            ) {
                ForEach(appInfos) { item in
                    AppInfoListRowView(appInfoItem: item)
                }
            }
            
            // MARK: - Icons
            
            
            
            // MARK: - About


        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .previewLayout(.sizeThatFits)
//            .preferredColorScheme(.dark)
    }
}
