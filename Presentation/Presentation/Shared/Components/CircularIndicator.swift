//
//  CircularIndicator.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 27/07/23.
//

import SwiftUI

struct CircularIndicator: View {
    @State var animate = false
    @State private var isRotating = false
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(AngularGradient(
                    gradient: .init(
                        colors: [Color.primaryLight,
                                 Color.primaryLight]),
                    center: .center),
                        style: StrokeStyle(lineWidth: 8, lineCap: .round)
                )
                .frame(width: 45, height: 45)
                .rotationEffect(.init(degrees: self.animate ? 360 : 0))
                .animation(.linear(duration: 0.7).repeatForever(autoreverses: false), value: isRotating)
                .padding(.bottom, 15)
        }
        .onAppear {
            self.animate.toggle()
            isRotating = true
        }
    }
}

struct CircularIndicator_Previews: PreviewProvider {
    static var previews: some View {
        CircularIndicator()
    }
}
