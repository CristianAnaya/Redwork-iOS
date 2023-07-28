//
//  RoleButtonComponent.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 27/07/23.
//

import SwiftUI

struct RoleButtonComponent: View {
    var image: String
    var title: String
    var destination: AnyView
    
    var body: some View {
        VStack {
            NavigationLink(destination: destination) {
                Image(image)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 100, height: 100)
            }
            Text(title)
                .font(FontManager.regularTitle)
        }
    }
}
