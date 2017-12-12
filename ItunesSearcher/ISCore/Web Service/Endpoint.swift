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
    case discography(artist:String)
}

internal extension Endpoint {
    func request(with baseURL: URL) -> URLRequest {
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
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
            return ""
        case .discography:
            return ""
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .searchResult(let query):
            return ["term":query,
                    "country":"es",
                    "media":"music",
                    "entity":"musicArtist",
                    "limit":"20"]
        case .discography(let artist):
            return ["term":artist]
        }
    }
}
