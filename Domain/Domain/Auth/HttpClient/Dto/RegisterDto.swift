//
//  RegisterDto.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 27/07/23.
//

import Foundation

struct RegisterDto: Codable {
    let name: String
    let lastname: String
    let email: String
    let phone: String
    let rolesIds: [String]
    let selectedService: [String]?
    
    enum CodingKeys: String, CodingKey {
        case name
        case lastname
        case email
        case phone
        case rolesIds = "rolesIds"
        case selectedService = "selected_service"
    }
}
