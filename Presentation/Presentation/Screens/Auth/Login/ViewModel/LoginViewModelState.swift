//
//  LoginViewModelState.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 22/07/23.
//

import Foundation
import Domain

enum LoginViewModelState: Equatable {
    case loading
    case success(data: Auth)
    case failure(error: String)
}
