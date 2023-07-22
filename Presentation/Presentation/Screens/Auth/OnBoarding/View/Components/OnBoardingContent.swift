//
//  OnBoardingContent.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import SwiftUI

struct OnBoardingStep {
    let image: String
    let title: String
    let description: String
}


private let onBoardingSteps = [
    OnBoardingStep(image: "intro1", title: "Encuentra tu servicio ya", description: "Escribe en el buscador el servicio que necesitas hoy."),
    
    OnBoardingStep(image: "intro2", title: "Negocia la tarifa del trabajo", description: "Escribele al prestador del servicio para acordar un precio."),
    
    OnBoardingStep(image: "intro3", title: "Y agenda tu trabajo!", description: "Recibe tu servicio y califica para mejorar la experiencia de todos.")
]

struct OnBoardingContent: View {
    @ObservedObject var viewModel: OnBoardingViewModel

    @State private var currentStep = 0
    
    init(viewModel: OnBoardingViewModel) {
        self.viewModel = viewModel
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        VStack {
            TabView(selection: $currentStep){
                ForEach(0..<onBoardingSteps.count, id:\.self) { it in
                    VStack {
                        
                        LottieView(
                            filename: onBoardingSteps[it].image,
                            loopMode: .loop
                        )
                        .scaleEffect(0.8)
                        
                        Text(onBoardingSteps[it].title)
                            .font(FontManager.boldHeadLine)
                            .padding(.top, 10)
                        
                        Text(onBoardingSteps[it].description)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 8)
                            .font(FontManager.lightHeadLine_2)
                            .padding(.top, 16)
                            .padding(10)
                    }
                    .tag(it)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack {
                ForEach(0..<onBoardingSteps.count, id:\.self) { it in
                    if it == currentStep {
                        Rectangle()
                            .frame(width: 20, height: 10)
                            .cornerRadius(10)
                            .foregroundColor(Color("PrimaryLight"))
                    } else {
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.bottom, 24)
            
            Button(action: {
                if self.currentStep < onBoardingSteps.count - 1 {
                    self.currentStep += 1
                } else {
                    viewModel.saveFirstTime()
                }
            }, label: {
                Text(currentStep < onBoardingSteps.count - 1 ? "Siguiente" : "Empezar")
                    .padding(16)
                    .frame(maxWidth: .infinity)
                    .background(Color("PrimaryLight"))
                    .cornerRadius(16)
                    .padding(.horizontal, 16)
                    .foregroundColor(.white)
            })
            .buttonStyle(PlainButtonStyle())
        }

    }
}

struct OnBoardingContent_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingContent(viewModel: DependencyInjectionContainer.shared.resolve(OnBoardingViewModel.self)!)
    }
}
