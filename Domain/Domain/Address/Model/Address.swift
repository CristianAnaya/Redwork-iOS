//
//  Address.swift
//  Domain
//
//  Created by CRISTIAN ANAYA on 20/07/23.
//

import Foundation

public struct Address: Equatable {
    public let address: String
    public let latitude: Double
    public let longitude: Double
    
    public init(address: String, latitude: Double, longitude: Double) {
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
    }
    
    public static func == (lhs: Address, rhs: Address) -> Bool {
        return lhs.address == rhs.address &&
               lhs.latitude == rhs.latitude &&
               lhs.longitude == rhs.longitude
    }
}
