//
//  Artist.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 11/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

struct Artist: Decodable {
    let name: String
    let genre: String
    let album: [Album]?
}
