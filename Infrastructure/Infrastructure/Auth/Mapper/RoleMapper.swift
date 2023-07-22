//
//  RoleMapper.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation
import Domain

extension Role {
    func toRoleDto() -> RoleDto {
        return RoleDto(id: id, name: name)
    }
}

extension RoleDto {
    func toRole() -> Role {
        return Role(id: id, name: name)
    }
}
