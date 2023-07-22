//
//  UserMapper.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation
import Domain

extension User {
    func toUserDto() -> UserDto {
        return UserDto(
            id: id,
            name: name,
            lastname: lastname,
            email: email,
            phone: phone,
            image: image,
            roles: roles?.map { $0.toRoleDto() },
            address: address?.map { $0.toAddressDto() }
        )
    }
}

extension UserDto {
    func toUser() -> User {
        return User(
            id: id,
            name: name,
            lastname: lastname,
            email: email,
            phone: phone,
            image: image,
            roles: roles?.map { $0.toRole() },
            address: address?.map { $0.toAddress() }
        )
    }
}

