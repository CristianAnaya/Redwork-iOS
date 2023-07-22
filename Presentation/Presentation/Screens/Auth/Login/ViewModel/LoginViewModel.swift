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

    @Published var state: LoginViewModelState? = nil
    private var getOTPUseCase: GetOTPUseCase
    private var cancellables = Set<AnyCancellable>()

    init(getOTPUseCase: GetOTPUseCase) {
        self.getOTPUseCase = getOTPUseCase
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
                    print("DEBUG 1: \(error.localizedDescription)")
                    self.state = .failure(error: error.localizedDescription)
                }
            } receiveValue: { validationId in
                self.loading = false
                print("DEBUG 2: \(validationId)")
                self.validationId = validationId
            }
            .store(in: &cancellables)
    }

    func verifyOTPAndLogin() {
    }


}
