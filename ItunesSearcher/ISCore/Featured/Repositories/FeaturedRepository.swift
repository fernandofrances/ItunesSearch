//
//  FeaturedRepository.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 12/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

protocol FeaturedRepositoryProtocol {
    func featuredArtists() -> [Artist]?
    func featuredAlbums() -> [Album]?
}
final class FeaturedRepository: FeaturedRepositoryProtocol {

    private let webService: WebService
    
    init(webService: WebService){
        self.webService = webService
    }
    
    func featuredArtists() -> [Artist]? {
        //Call the webService and load featured artists
        return []
    }
    
    func featuredAlbums() -> [Album]? {
        //call the webService and load featured albums
        return []
    }
    
    
}
