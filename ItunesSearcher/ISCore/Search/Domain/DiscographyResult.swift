//
//  DiscographyResult.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 12/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

enum DiscographyResult {
    case artist(Artist)
    case album(Album)
}
extension DiscographyResult: Decodable {
    private enum CodingKeys: String, CodingKey {
        case wrapperType = "wrapperType"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .wrapperType)
        switch type {
        case "artist":
            self = try .artist(Artist(from: decoder))
        case "album":
            self = try .album(Album(from: decoder))
        default:
            let context = DecodingError.Context(codingPath: [CodingKeys.wrapperType], debugDescription: "Unknown type: \(type)")
            throw DecodingError.dataCorrupted(context)
        }
    }
}
