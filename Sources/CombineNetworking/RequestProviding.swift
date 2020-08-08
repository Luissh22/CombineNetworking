//
//  RequestProviding.swift
//  
//
//  Created by Luis Abraham on 2020-08-08.
//

import Foundation

public protocol RequestProviding {
    var urlRequest: URLRequest { get }
}

public enum HTTPMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

public extension URLRequest {
    mutating func makeJSONPOSTRequest(withParameters parameters: [String: Any]) {
        httpMethod = HTTPMethod.post.rawValue
        setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters) else { return }
        self.httpBody = httpBody
    }
}
