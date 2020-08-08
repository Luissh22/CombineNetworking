//
//  Networking.swift
//  
//
//  Created by Luis Abraham on 2020-08-08.
//

import Combine
import Foundation

public protocol Networking {
    func execute<T: Decodable>(_ requestProvider: RequestProviding) -> AnyPublisher<T, Error>
}

public struct APISession: Networking {
    
    var decoder: JSONDecoder
    
    public init(decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
    }
    
    public func execute<T>(_ requestProvider: RequestProviding) -> AnyPublisher<T, Error> where T : Decodable {
        URLSession.shared.dataTaskPublisher(for: requestProvider.urlRequest)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}

