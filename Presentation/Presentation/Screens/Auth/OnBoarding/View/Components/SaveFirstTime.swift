//
//  SaveFirstTime.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import SwiftUI

struct SaveFirstTime: View {
    
    @ObservedObject var viewModel: OnBoardingViewModel
    
    var body: some View {
        NavigationView {
            switch viewModel.state {
            case .initial:
                OnBoardingContent(viewModel: viewModel)
            case .success:
                LoginView()
            case .failure(let error):
                Text("Error: \(error)")
            }
        }
    }
}

struct SaveFirstTime_Previews: PreviewProvider {
    static var previews: some View {
        SaveFirstTime(viewModel: DependencyInjectionContainer.shared.resolve(OnBoardingViewModel.self)!)
    }
}
