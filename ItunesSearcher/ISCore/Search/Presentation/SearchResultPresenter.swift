//
//  SearchResultPresenter.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 12/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

/// presents search results in cells
final class SearchResultPresenter{
    func present(artist: Artist, in cell: SearchCell) {
        cell.artist = artist
        cell.title.text = artist.artistName
        cell.genre.text = artist.primaryGenreName
    }
    
    func present(discography: [Album], in cell: SearchCell){
        
    }
}
