//
//  Color.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import SwiftUI

extension Color {
    static let primaryDark = Color(Color.Key.primaryDark.rawValue)
    static let primaryLight = Color(Color.Key.primaryLight.rawValue)
    static let customOrange = Color(Color.Key.customOrange.rawValue)
    static let customBlack = Color(Color.Key.customBlack.rawValue)
    static let customGray = Color(Color.Key.customGray.rawValue)

    enum Key: String {
        case primaryDark = "PrimaryDark"
        case primaryLight = "PrimaryLight"
        case customOrange = "Orange"
        case customBlack = "Black"
        case customGray = "Gray"
    }
    
}
