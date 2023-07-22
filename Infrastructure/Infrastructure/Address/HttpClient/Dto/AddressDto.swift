//
//  AddressDto.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation

struct AddressDto: Codable {
    let address: String
    let latitude: Double
    let longitude: Double
}
