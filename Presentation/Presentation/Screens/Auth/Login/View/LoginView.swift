//
//  LoginView.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import SwiftUI
import Combine
import Domain
import SwiftUI_SimpleToast

struct LoginView: View {
    @EnvironmentObject private var viewModel: LoginViewModel
    
    private let toastOptions = SimpleToastOptions(
        alignment: .bottom,
        hideAfter: 2,
        backdrop: Color.black.opacity(0.2),
        animation: .default,
        modifierType: .slide
    )

    var body: some View {
        ZStack(alignment: .center) {
            LoginViewContent(viewModel: viewModel)
            if viewModel.loading {
                CircularIndicatorMessage(message: "Por favor espere un momento..")
            }
            
            if case .loading = viewModel.state {
                CircularIndicatorMessage(message: "Confirmando codigo...")
            }
            
            if case let .success(data) = viewModel.state {
                if data.user != nil {
                    NavigationView {
                        ClientHomeView()
                    }
                } else {
                    NavigationView {
                        RolesView()
                            .environmentObject(
                                DependencyInjectionContainer.shared.resolve(
                                    RolesViewModel.self,
                                    argument1: "\(viewModel.code)\(viewModel.phone)"
                                )!
                            )
                    }
                }
            }
            
        }
        .simpleToast(isPresented: $viewModel.failed, options: toastOptions, content: {
            if case let .failure(error) = viewModel.state {
                HStack {
                    Text(error)
                        .bold()
                        .font(.system(size: 15))
                }
                .padding(20)
                .background(Color.black.opacity(0.8))
                .foregroundColor(Color.white)
                .cornerRadius(14)
            }
        })
    }
}
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
                .environmentObject(
                    LoginViewModel(
                        getOTPUseCase: DependencyInjectionContainer.shared.resolve(GetOTPUseCase.self)!,
                        loginUseCase: DependencyInjectionContainer.shared.resolve(LoginUseCase.self)!
                    )
                )
        }
    }

