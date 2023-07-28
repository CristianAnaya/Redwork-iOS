//
//  RegisterWorkerViewModel.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 27/07/23.
//

import Foundation
import Domain
import Combine

final class RegisterWorkerViewModel: ObservableObject {
    
    @Published var state = RegisterWorkerState()
    @Published var failed: Bool = false
    @Published var registerViewModelState: RegisterWorkerViewModelState? = nil
    
    private var cancellables = Set<AnyCancellable>()
    private let registerUseCase: RegisterUseCase
    private let phone: String
    private let role: String
    
    init(
        registerUseCase: RegisterUseCase,
        phone: String,
        role: String
    ) {
        self.registerUseCase = registerUseCase
        self.phone = phone
        self.role = role
        state.role.append(self.role)
        state.phone = self.phone
    }
    
    func register() {
        self.registerViewModelState = .success
//        registerViewModelState = .loading
//        print("RegisterWorkerViewModel: \(state.toRegister())")
//        registerUseCase.invoke(register: state.toRegister())
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .finished:
//                    self.registerViewModelState = .success
//                case .failure(let error):
//                    self.failed = true
//                    self.registerViewModelState = .failure(error: error.localizedDescription)
//                }
//            }) { data in
//                self.registerViewModelState = .success
//            }
//            .store(in: &cancellables)
    }
    
}
