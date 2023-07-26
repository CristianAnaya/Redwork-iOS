//
//  CircularIndicatorMessage.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 22/07/23.
//

import SwiftUI

struct CircularIndicatorMessage: View {
    let message: String
    @State var animate = false
    @State private var isRotating = false
    
    var body: some View {
        ZStack {
            VStack {
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

                Text(message)
                    .font(FontManager.mediumTitle)
                    .foregroundColor(.black)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 10)
        }
        .onAppear {
            self.animate.toggle()
            isRotating = true
        }
        .frame(width: 250)
    }

//
//    var body : some View {
//
//        VStack {
//            Circle()
//                .trim(from: 0, to: 0.8)
//                .stroke(AngularGradient(
//                    gradient: .init(
//                        colors: [Color.primaryLight,
//                                 Color.primaryLight]),
//                    center: .center),
//                        style: StrokeStyle(lineWidth: 8, lineCap: .round)
//                )
//                .frame(width: 45, height: 45)
//                .rotationEffect(.init(degrees: self.animate ? 360 : 0))
//                .animation(.linear(duration: 0.7).repeatForever(autoreverses: false), value: isRotating)
//
//        }
//        .onAppear {
//            self.animate.toggle()
//            isRotating = true
//        }
//    }
}

struct CircularIndicatorMessage_Previews: PreviewProvider {
    static var previews: some View {
        CircularIndicatorMessage(message: "Espere por favor")
    }
}
