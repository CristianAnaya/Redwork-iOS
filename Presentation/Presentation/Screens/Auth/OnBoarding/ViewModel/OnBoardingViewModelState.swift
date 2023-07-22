//
//  OnBoardingViewModelState.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation

enum RegisterViewModelState: Equatable {
    case initial
    case success
    case failure(error: String)
}
