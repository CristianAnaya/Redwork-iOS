//
//  OTPComposableView.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 22/07/23.
//

import SwiftUI
import Domain

struct OTPComposableView: View {
    @EnvironmentObject private var viewModel: LoginViewModel
    @Environment(\.colorScheme) var colorScheme
    @State private var isTextFieldVisible = false

    var body: some View {
        if !viewModel.validationId.isEmpty {
            TextField("", text: $viewModel.otp)
                .font(FontManager.mediumTitle)
                .placeholder(when: viewModel.otp.isEmpty) {
                    Text("Codigo de 6 digitos")
                        .font(FontManager.mediumTitle)
                        .foregroundColor(.secondary)
                }
                .keyboardType(.numbersAndPunctuation)
                .padding(14)
                .frame(minWidth: 80, minHeight: 47)
                .background(backgroundColor, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                .offset(x: isTextFieldVisible ? 0 : -100)
                .onAppear {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        isTextFieldVisible = true
                    }
                }
        }
        
    }

    
    var backgroundColor: Color {
        if colorScheme == .dark {
            return Color(.systemGray5)
        } else {
            return Color(.systemGray6)
        }
    }
}

struct OTPComposableView_Previews: PreviewProvider {
    static var previews: some View {
        OTPComposableView()
            .environmentObject(LoginViewModel(getOTPUseCase: DependencyInjectionContainer.shared.resolve(GetOTPUseCase.self)!))
    }
}
