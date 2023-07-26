//
//  LoginViewModelState.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 22/07/23.
//

import Foundation

enum LoginViewModelState: Equatable {
    case loading
    case success
    case failure(error: String)
}
