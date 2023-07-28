//
//  RegisterMapper.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 27/07/23.
//

import Foundation
import Domain

extension Register {
    func toRegisterDto() -> RegisterDto {
        return RegisterDto(
            name: name,
            lastname: lastName,
            email: email,
            phone: phone,
            rolesIds: idRole.map { $0 },
            selectedService: selectedService.map { $0 }
        )
    }
}
