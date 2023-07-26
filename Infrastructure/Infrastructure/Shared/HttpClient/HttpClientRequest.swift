//
//  HttpClientRequest.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Alamofire

public protocol HttpClientRequest {
    associatedtype Object
    
    var endpoint: String { get }
    var httpHeaders: [String : String] { get }
    var params: [String: Any]? { get }
    var paramsJSON: String { get }
    var httpMethod: HTTPMethod { get }
    
    init(object: Object)
}

extension HttpClientRequest {
    var paramsJSON: String { "" }
}
