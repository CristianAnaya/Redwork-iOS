//
//  OnBoardingViewModel.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation
import Domain
import Combine

final class OnBoardingViewModel: ObservableObject {
    private let saveFirstTimeUseCase: SaveFirstTimeUseCase
    private var cancellables = Set<AnyCancellable>()
    @Published var state: OnBoardingViewModelState = .initial

    init(saveFirstTimeUseCase: SaveFirstTimeUseCase) {
        self.saveFirstTimeUseCase = saveFirstTimeUseCase
        state = .initial
    }
    
    func saveFirstTime() {
        saveFirstTimeUseCase.invoke(status: true)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.state = .success
                case .failure(let error):
                    self.state = .failure(error: error.localizedDescription)
                }
            }) { data in
                self.state = .success
            }
            .store(in: &cancellables)
    }
}
