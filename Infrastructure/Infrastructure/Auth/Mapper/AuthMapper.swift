//
//  AuthMapper.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation
import Domain

extension Auth {
    func toAuthDto() -> AuthDto {
        return AuthDto(user: user?.toUserDto(), token: token)
    }
}

extension AuthDto {
    func toAuth() -> Auth {
        return Auth(user: user?.toUser(), token: token)
    }
}
