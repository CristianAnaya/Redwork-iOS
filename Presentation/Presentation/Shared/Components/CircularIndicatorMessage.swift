//
//  CircularIndicatorMessage.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 22/07/23.
//

import SwiftUI

struct CircularIndicatorMessage: View {
    let message: String
    
    var body: some View {
        ZStack {
            Color.white
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                ProgressView()
                    .padding(.bottom, 15)
                Text(message)
                    .font(FontManager.mediumTitle)
                    .foregroundColor(.black)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 10)
        }
        .frame(width: 250)
    }
}

struct CircularIndicatorMessage_Previews: PreviewProvider {
    static var previews: some View {
        CircularIndicatorMessage(message: "Espere por favor")
    }
}
