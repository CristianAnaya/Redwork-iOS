//
//  LoginViewModel.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 22/07/23.
//

import Foundation
import UIKit
import Combine
import Domain

class LoginViewModel: ObservableObject {
    @Published var phone: String = ""
    @Published var code: String = "+57"
    @Published var otp: String = ""
    @Published var validationId: String = ""
    @Published var loading: Bool = false
    @Published var failed: Bool = false

    @Published var state: LoginViewModelState? = nil
    private var getOTPUseCase: GetOTPUseCase
    private var loginUseCase: LoginUseCase
    private var cancellables = Set<AnyCancellable>()

    init(getOTPUseCase: GetOTPUseCase, loginUseCase: LoginUseCase) {
        self.getOTPUseCase = getOTPUseCase
        self.loginUseCase = loginUseCase
    }
    
    func onPhoneInput(_ phone: String) {
        self.phone = phone
    }

    func onOTPInput(_ otp: String) {
        self.otp = otp
    }

    func onCountryInput(code: String) {
        self.code = code
    }
    
    func onValidationId(validationId: String) {
        self.validationId = validationId
    }

    func sendOTPToPhoneNumber() {
        loading = true
        getOTPUseCase.invoke(phone: phone, country: code)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.loading = false
                    self.state = .failure(error: error.localizedDescription)
                }
            } receiveValue: { validationId in
                self.loading = false
                self.validationId = validationId
            }
            .store(in: &cancellables)
    }

    func verifyOTPAndLogin() {
        state = .loading
        loginUseCase.invoke(phone: "\(code)\(phone)", code: otp, verificationId: validationId)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.failed = true
                    self.state = .failure(error: error.localizedDescription)
                }
            } receiveValue: { validationId in
                self.state = .success
            }
            .store(in: &cancellables)
    }


}
