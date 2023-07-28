//
//  RegisterRequest.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 27/07/23.
//

import Foundation
import Alamofire

struct RegisterRequest: HttpClientRequest {
    typealias Model = AuthDto?
    
    let baseURL = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String ?? ""
    var endpoint: String { baseURL + "auth/register" }
    let httpHeaders: [String: String] = ["Content-Type": "application/json"]
    var params: [String: Any]? = nil
    var httpMethod: Alamofire.HTTPMethod =  .post
    
    init(object: Any?) {
        if let jsonData = object as? Data {
            // Convert the JSON data to [String: Any] dictionary
            do {
                self.params = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
            } catch {
                // Handle any error during JSON deserialization
                print("Error deserializing JSON data: \(error)")
            }
        }
    }
    
}
