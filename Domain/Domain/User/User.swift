//
//  User.swift
//  Domain
//
//  Created by CRISTIAN ANAYA on 20/07/23.
//

import Foundation

public struct User: Equatable {
    public let id: Int?
    public var name: String
    public var lastname: String
    public let email: String?
    public var phone: String
    public var image: String?
    public let roles: [Role]?
    public let address: [Address]?
    
    public init(id: Int?, name: String, lastname: String, email: String?, phone: String, image: String? = nil, roles: [Role]?, address: [Address]?) {
        self.id = id
        self.name = name
        self.lastname = lastname
        self.email = email
        self.phone = phone
        self.image = image
        self.roles = roles
        self.address = address
    }
    
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id &&
               lhs.name == rhs.name &&
               lhs.lastname == rhs.lastname &&
               lhs.email == rhs.email &&
               lhs.phone == rhs.phone &&
               lhs.image == rhs.image &&
               lhs.roles == rhs.roles &&
               lhs.address == rhs.address
    }
}
