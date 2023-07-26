//
//  UserDto.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation

struct UserDto: Codable {
    let id: Int?
    let name: String
    let lastname: String
    let email: String?
    let phone: String
    let image: String?
    let roles: [RoleDto]?
    let address: [AddressDto]?
}
