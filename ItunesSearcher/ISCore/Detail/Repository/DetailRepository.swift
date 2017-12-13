//
//  DetailRepository.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 13/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

protocol DetailRepositoryProtocol {
    func artistToShow() -> Artist
}

final class DetailRepository : DetailRepositoryProtocol {
    
    private let artist: Artist
    
    init(artist: Artist){
        self.artist = artist
    }
    
    func artistToShow() -> Artist {
        return artist
    }
}
