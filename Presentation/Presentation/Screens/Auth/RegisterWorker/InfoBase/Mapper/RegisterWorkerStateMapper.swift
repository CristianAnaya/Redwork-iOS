//
//  RegisterWorkerStateMapper.swift
//  Presentation
//
//  Created by CRISTIAN ANAYA on 27/07/23.
//

import Foundation
import Domain

extension RegisterWorkerState {
    func toRegister() -> Register {
        return Register(
            name: name,
            lastName: lastname,
            email: email,
            phone: phone,
            idRole: role,
            selectedService: nil
        )
    }
}

