//
//  OnBoardingView.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import SwiftUI

struct OnBoardingView: View {
    
    @State private var currentStep = 0
    @EnvironmentObject private var viewModel: OnBoardingViewModel

    var body: some View {
        VStack {
            SaveFirstTime(viewModel: viewModel)
        }
    }
}
struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
