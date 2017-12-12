//
//  Page.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 12/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

struct Page<T:Decodable>: Decodable {
    let resultCount: Int
    let results: [T]
}
