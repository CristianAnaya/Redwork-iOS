//
//  LottieView.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var filename: String
    let loopMode: LottieLoopMode
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let animationView = LottieAnimationView(name: filename)
        animationView.loopMode = loopMode
        animationView.play()
        
        return animationView
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        
    }
}

