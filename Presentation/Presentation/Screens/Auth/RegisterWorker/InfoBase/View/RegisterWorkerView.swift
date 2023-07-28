//
//  RegisterWorkerView.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 27/07/23.
//

import SwiftUI
import Domain
import SwiftUI_SimpleToast

struct RegisterWorkerView: View {
    
    @EnvironmentObject private var viewModel: RegisterWorkerViewModel
    @State private var navigateToCompleteInfo = false // Agregar estado para la navegación

    private let toastOptions = SimpleToastOptions(
        alignment: .bottom,
        hideAfter: 2,
        backdrop: Color.black.opacity(0.2),
        animation: .default,
        modifierType: .slide
    )

    var body: some View {
        VStack {
            RegisterWorkerContent(viewModel: viewModel)
            
            if case .loading = viewModel.registerViewModelState {
                CircularIndicator()
            }
            
            // Cuando el estado sea .success, activamos la navegación a CompleteInfoView
            if case .success = viewModel.registerViewModelState {
                CompleteInfoView()
            }
        }
        .simpleToast(isPresented: $viewModel.failed, options: toastOptions, content: {
            if case let .failure(error) = viewModel.registerViewModelState {
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
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton(label: "Cuenta creada"))
    }
    
}

struct RegisterWorkerView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterWorkerView()
            .environmentObject(
                RegisterWorkerViewModel(
                    registerUseCase: DependencyInjectionContainer.shared.resolve(RegisterUseCase.self)!,
                    phone: "3232323",
                    role: "Client"
                )
            )
    }
}
