//
//  CustomDefaultButton.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 27/07/23.
//

import SwiftUI

struct CustomDefaultButton: View {
    let text: String
    let style: Font
    let roundedCornerValue: CGFloat
    let onClick: () -> Void
    let color: Color = Color.primaryLight

    var body: some View {
        Button(action: onClick) {
            Text(text)
                .font(style)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(color)
                .cornerRadius(roundedCornerValue)
        }
    }
}
