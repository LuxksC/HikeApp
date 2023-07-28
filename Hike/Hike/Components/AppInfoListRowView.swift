//
//  AppInfoListRowView.swift
//  Hike
//
//  Created by Lucas de Castro Souza on 24/07/23.
//

import SwiftUI

struct AppInfoListRowView: View {
    @State var appInfoItem: AppInfoItem?
    
    var body: some View {
        LabeledContent {
            if let link = appInfoItem?.link {
                Link(appInfoItem?.content ?? "", destination: URL(string: link)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
            } else {
                Text(appInfoItem?.content ?? "")
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            }
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(appInfoItem?.color ?? .red)
                    Image(systemName: appInfoItem?.icon ?? "")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(appInfoItem?.title ?? "")
            }
        }
    }
}

struct AppInfoListRowView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            AppInfoListRowView(appInfoItem: appInfos.first)
        }
    }
}
