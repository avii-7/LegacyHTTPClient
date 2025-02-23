//
//  File.swift
//  LegacyHTTPClient
//
//  Created by Arun on 16/02/25.
//

import Foundation

// TODO: Author wants to encapsulte common some logic so he replaced HTTPLoading Protocol with this class.
open class HTTPLoader {
    
    public var nextLoader: HTTPLoader? {
        willSet {
            guard nextLoader == nil else { fatalError("The next loader may only be set once.") }
        }
    }
    
    public init() { }
    
    open func load(request: HTTPRequest, completion: @escaping @Sendable (HTTPResult) -> Void) {
        if let nextLoader {
            nextLoader.load(request: request, completion: completion)
        }
        else {
            let error = HTTPError(code: .invalidRequest, request: request, response: nil, underlyingError: nil)
            completion(.failure(error))
        }
    }
}
