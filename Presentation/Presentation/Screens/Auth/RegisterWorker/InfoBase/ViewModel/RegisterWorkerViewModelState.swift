//
//  RegisterWorkerViewModelState.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 27/07/23.
//

import Foundation

enum RegisterWorkerViewModelState: Equatable {
    case loading
    case success
    case failure(error: String)
}
