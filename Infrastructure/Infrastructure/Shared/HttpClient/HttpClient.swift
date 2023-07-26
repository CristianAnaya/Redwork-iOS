//
//  HttpClient.swift
//  Infrastructure
//
//  Created by CRISTIAN ANAYA on 21/07/23.
//

import Foundation
import Combine
import Alamofire

final class HttpClient {
    let session: Session
    
    convenience init () {
        let configuration: URLSessionConfiguration = URLSession.configuration()
        self.init(configuration: configuration)
    }
    
    init(configuration: URLSessionConfiguration) {
        self.session = Session(configuration: configuration)
    }
    
    func requestGeneric<R: HttpClientRequest, T: Decodable>(
        request: R,
        entity: T.Type,
        queue: DispatchQueue,
        retries: Int = 0
    ) -> AnyPublisher<T, HttpClientError> {
        let headers = HTTPHeaders(request.httpHeaders)
        let method = request.httpMethod
                
        guard let url = URL(string: request.endpoint) else {
            return Fail(error: HttpClientError(status: .unknown)).eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers.dictionary
        
        if method == .post || method == .put {
            urlRequest = try! JSONEncoding.default.encode(urlRequest, with: request.params)
        }
        
        return session.request(urlRequest)
            .validate()
            .response { result in
                debugPrint(result)
            }
            .publishDecodable(type: T.self)
            .value()
            .retry(retries)
            .receive(on: queue)
            .mapError { self.evaluateError($0)}
            .eraseToAnyPublisher()
    }
    
    private func evaluateError(_ error: AFError) -> HttpClientError {
        print("ENTRO AQUI \(error)")
        if let code = error.responseCode {
            return HttpClientError(errorCode: code)
        } else {
            return HttpClientError(status: .unknown)
        }
    }
}
