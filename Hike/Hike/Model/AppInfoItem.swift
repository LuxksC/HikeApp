//
//  AppInfoItem.swift
//  Hike
//
//  Created by Lucas de Castro Souza on 24/07/23.
//

import Foundation
import SwiftUI

struct AppInfoItem: Identifiable {
    let id: Int
    let icon: String
    let title: String
    let content: String
    let color: Color
    let link: String?
    
    init(
        id: Int,
        icon: String,
        title: String,
        content: String,
        color: Color,
        link: String? = nil
    ) {
        self.id = id
        self.icon = icon
        self.title = title
        self.content = content
        self.color = color
        self.link = link
    }
}
