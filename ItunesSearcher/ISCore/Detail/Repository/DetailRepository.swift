//
//  DetailRepository.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 13/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

protocol DetailRepositoryProtocol {
    func artistAlbums() -> [Album]
    func artistToShow() -> Artist
}

final class DetailRepository : DetailRepositoryProtocol {
    
    private let dateFormatter: DateFormatter
    private let artist: Artist
    
    init(artist: Artist, dateFormatter: DateFormatter){
        self.artist = artist
        self.dateFormatter = dateFormatter
    }
    
    func artistToShow() -> Artist {
        return artist
    }
    
    func artistAlbums() -> [Album] {
        return orderAlbums()
    }
}

private extension DetailRepository {
    func orderAlbums() -> [Album] {
        var albums : [Album] = []
        artist.discography!.forEach { type in
            switch type {
            case var .album(album):
                if let date = dateFormatter.date(from: album.releaseDate) {
                    let calendar = Calendar.current
                    let year = calendar.component(.year, from: date)
                    album.releaseYear = year
                    albums.append(album)
                }
            default:
                print("not an album")
            }
        }
        return albums.sorted(by: {$0.releaseYear! > $1.releaseYear!})
    }
}
