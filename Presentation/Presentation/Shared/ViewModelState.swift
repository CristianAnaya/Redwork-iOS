//
//  ViewModelState.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation

enum ViewModelState<T>: Equatable where T: Equatable {
    case loading
    case success(data: T?)
    case failure(error: String)
}
