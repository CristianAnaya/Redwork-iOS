//
//  AuthDto.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation

struct AuthDto: Codable {
    let user: UserDto?
    let token: String?
}
