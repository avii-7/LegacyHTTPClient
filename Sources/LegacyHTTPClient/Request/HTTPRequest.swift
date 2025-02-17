//
//  File.swift
//  LegacyHTTPClient
//
//  Created by Arun on 15/02/25.
//

import Foundation

public struct HTTPRequest: Sendable {
    
    private var urlComponents: URLComponents = .init()
    
    public var httpMethod: HTTPMethod = .get
    
    // TODO: Maybe we need to make dictionary keys case-Insensitve  -
    public var headers: [String: String] = [:]
    
    public var body: HTTPBody = EmptyBody()
    
    public var url: URL? { urlComponents.url }
    
    public init() {
        urlComponents.scheme = "https"
    }
}

public extension HTTPRequest {
    
   var scheme: String { urlComponents.scheme ?? "https" }
    
    var host: String {
        get { urlComponents.host ?? "" }
        set { urlComponents.host = newValue }
    }
    
    var path: String {
        get { urlComponents.path }
        set { urlComponents.path = newValue }
    }
}
