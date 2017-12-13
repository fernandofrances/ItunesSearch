//
//  Album.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 11/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

struct Album : Decodable {
    let wrapperType: String
    let collectionName: String
    let releaseDate: String
    let artworkUrl100: String
    let artistName: String
    let primaryGenreName: String
}
