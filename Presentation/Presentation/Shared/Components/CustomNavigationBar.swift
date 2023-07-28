//
//  CustomNavigationBar.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 27/07/23.
//

import SwiftUI

struct CustomNavigationBar: View {
    let title: String

    var body: some View {
        HStack {
            Text(title)
                .font(FontManager.mediumHeadLine)
                .multilineTextAlignment(.leading)
                .padding(.leading, 16)
            Spacer()
        }
        .frame(height: 44)
    }
    
}

struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBar(title: "Titulo del bar")
    }
}
