//
//  RolesViewModel.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 27/07/23.
//

import Foundation
import Domain
import Combine

final class RolesViewModel: ObservableObject {
    
    let phone: String
    
    init(phone: String) {
        self.phone = phone
    }
    
}
