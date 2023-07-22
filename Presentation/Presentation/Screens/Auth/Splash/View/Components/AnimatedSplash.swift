//
//  AnimatedSplash.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import SwiftUI

struct AnimatedSplash: View {
    @ObservedObject var viewModel: SplashViewModel

    @State private var startAnimation = false
    
    var body: some View {
        let alpha = startAnimation ? 1.0 : 0.0
        ZStack {
            Image("splash_screen")
                .resizable()
                .opacity(alpha)
                .scaledToFill() // Utilizar .scaledToFill() en lugar de .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    withAnimation(.easeIn(duration:  3.0)) {
                        startAnimation = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        viewModel.getSessionData()
                    }
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color("PrimaryLight")
            )
            .ignoresSafeArea()
            .opacity(alpha)

    }
}

struct CenterAlignment: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        return context.height / 2 // Centrar verticalmente en el eje Y
    }
}

extension VerticalAlignment {
    static let center = CenterAlignment()
}

struct AnimatedSplash_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedSplash(viewModel: DependencyInjectionContainer.shared.resolve(SplashViewModel.self)!)
    }
}
