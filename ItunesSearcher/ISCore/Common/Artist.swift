//
//  Artist.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 11/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

struct Artist: Decodable {
    let artistName: String
    let artistId: Int64
    let artistLinkUrl: String
    let primaryGenreName: String
    let discography: [Album]?
}
