//
//  LoginRequest.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 26/07/23.
//

import Foundation
import Alamofire

struct LoginRequest: HttpClientRequest {
    typealias Model = Any?
    
    let baseURL = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String ?? ""
    var endpoint: String { baseURL + "auth/login" }
    let httpHeaders: [String: String] = ["Content-Type": "application/json"]
    var params: [String: Any]? = nil
    var httpMethod: Alamofire.HTTPMethod =  .post
    
    init(object: Any?) {
    }
    
}
