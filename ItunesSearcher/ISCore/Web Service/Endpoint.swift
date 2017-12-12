//
//  Endpoint.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 11/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

internal enum Endpoint {
    case searchResult(query: String)
    case discography(id:Int64)
}

internal extension Endpoint {
    func request(with baseURL: URL) -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = self.parameters.map(URLQueryItem.init)
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        print("Request URL: \(request.url!)")
        return request
    }
}

private enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
}

private extension Endpoint {
    var method: HTTPMethod {
        switch self {
        case .searchResult:
            return .get
        case .discography:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .searchResult:
            return "search"
        case .discography:
            return "lookup"
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .searchResult(let query):
            return ["term":query,
                    "entity":"musicArtist",
                    "limit":"20",
                    "country":"es",
                    "media":"music"]
        case .discography(let id):
            return ["id":String(id),
                    "entity":"album"]
        }
    }
    
}
