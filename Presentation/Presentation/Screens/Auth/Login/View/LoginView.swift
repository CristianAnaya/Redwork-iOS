//
//  LoginView.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import SwiftUI
import Combine
import Domain

struct LoginView: View {
    @EnvironmentObject private var viewModel: LoginViewModel
    
    var body: some View {
        ZStack(alignment: .center) {
            LoginViewContent(viewModel: viewModel)
            
            if viewModel.loading {
                CircularIndicatorMessage(message: "Por favor espere un momento")
                    .background(Color.black.opacity(0.3))
                    .ignoresSafeArea()
            }
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(LoginViewModel(getOTPUseCase: DependencyInjectionContainer.shared.resolve(GetOTPUseCase.self)!))
    }
}
