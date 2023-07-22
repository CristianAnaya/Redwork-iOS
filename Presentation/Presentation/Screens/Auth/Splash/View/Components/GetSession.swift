//
//  GetSession.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import SwiftUI

struct GetSession: View {
    
    @ObservedObject var viewModel: SplashViewModel

    var body: some View {
        NavigationView {
            switch viewModel.state {
            case .loading:
                AnimatedSplash(viewModel: viewModel)
            case .success(let auth):
                if let isFirstTime = viewModel.isFirstTime {
                    if !isFirstTime {
                        OnBoardingView()
                            .environmentObject(DependencyInjectionContainer.shared.resolve(OnBoardingViewModel.self)!)
                    } else {
                        if (auth?.user) != nil {
                            ClientHomeView()
                        } else {
                            LoginView()
                        }
                    }
                }
            case .failure(let error):
                Text("Error: \(error)")
            }
        }
    }
    
}

struct GetSession_Previews: PreviewProvider {
    static var previews: some View {
        GetSession(viewModel: DependencyInjectionContainer.shared.resolve(SplashViewModel.self)!)
    }
}
