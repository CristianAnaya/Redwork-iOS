//
//  AddressMapper.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation
import Domain

extension Address {
    func toAddressDto() -> AddressDto {
        return AddressDto(address: address, latitude: latitude, longitude: longitude)
    }
}

extension AddressDto {
    func toAddress() -> Address {
        return Address(address: address, latitude: latitude, longitude: longitude)
    }
}
