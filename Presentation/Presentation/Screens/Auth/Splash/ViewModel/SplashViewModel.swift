//
//  SplashViewModel.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation
import Domain
import Combine
import UIKit

final class SplashViewModel: ObservableObject {
    private let getSessionUseCase: GetSessionUseCase
    private let getFirstTimeUseCase: GetfirstTimeUseCase
    private var cancellables = Set<AnyCancellable>()
    @Published var state: ViewModelState<Auth> = .loading
    @Published var isFirstTime: Bool? = nil

    init(
        getSessionUseCase: GetSessionUseCase,
        getFirstTimeUseCase: GetfirstTimeUseCase
    ) {
        self.getSessionUseCase = getSessionUseCase
        self.getFirstTimeUseCase = getFirstTimeUseCase
        getFirstTime()
        printAllFonts()
    }
    
    func getSessionData() {
        getSessionUseCase.invoke()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished: break
                case .failure(let error):
                    self.state = .failure(error: error.localizedDescription)
                }
            }) { data in
                self.state = .success(data: data)
            }
            .store(in: &cancellables)
    }
    
    private func getFirstTime() {
        getFirstTimeUseCase.invoke()
            .sink(receiveCompletion: { _ in }) { isFirstTime in
                self.isFirstTime = isFirstTime
            }
            .store(in: &cancellables)
    }
    
    func printAllFonts() {
        for familyName in UIFont.familyNames {
            print("Font Family: \(familyName)")
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print(" - \(fontName)")
            }
            print("-------------------------")
        }
    }

}
