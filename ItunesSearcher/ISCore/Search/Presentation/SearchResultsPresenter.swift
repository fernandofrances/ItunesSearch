//
//  SearchResultsPresenter.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 12/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

protocol SearchView: class {
    func update(with artists: [Artist])
    func update(with albums: [DiscographyResult], at index: Int)
}

final class SearchResultsPresenter {
    private let repository:  SearchResultsRepositoryProtocol
    private let detailNavigator: DetailNavigator
    weak var view: SearchView?
    
    init(repository: SearchResultsRepositoryProtocol, detailNavigator: DetailNavigator){
        self.repository = repository
        self.detailNavigator = detailNavigator
    }
    
    func didSelect(artist: Artist) {
        detailNavigator.showDetail(artist: artist)
    }
}

extension SearchResultsPresenter {
    func search(with query: String){
        let apiQuery = query.replacingOccurrences(of: " ", with: "+")
        repository.searchResults(withQuery:apiQuery) { (artists: [Artist]) in
            self.view?.update(with: artists)
            self.lookUpDiscographyForArtists(artists: artists)
           
        }
    }
    
    func lookUpDiscographyForArtists(artists: [Artist]) {
        for i in 0..<artists.count {
            self.repository.loadDiscography(forArtist: String(artists[i].artistId),
                                            onResults: { (results: [DiscographyResult]) in
                                                if(results.count > 1){
                                                    var albums = results
                                                    albums.removeFirst()
                                                    self.view?.update(with: albums, at: i)
                                                }
            })
        }
    }
}
