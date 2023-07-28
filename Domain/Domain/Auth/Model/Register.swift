//
//  Register.swift
//  Domain
//
//  Created by CRISTIAN ANAYA on 20/07/23.
//

import Foundation

public struct Register {
    public let name: String
    public let lastName: String
    public let email: String
    public let phone: String
    public let idRole: [String]
    public let selectedService: [String]?
    
    public init(name: String, lastName: String, email: String, phone: String, idRole: [String], selectedService: [String]?) {
        self.name = name
        self.lastName = lastName
        self.email = email
        self.phone = phone
        self.idRole = idRole
        self.selectedService = selectedService
    }
}
