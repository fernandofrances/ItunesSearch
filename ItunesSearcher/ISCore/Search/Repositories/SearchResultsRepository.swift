//
//  SearchResultsRepository.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 12/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

protocol SearchResultsRepositoryProtocol {
    func searchResults(withQuery query: String, onResults: @escaping ([Artist]) -> Void) -> Void
    func loadDiscography(forArtist id: String, onResults: @escaping ([DiscographyResult]) -> Void) -> Void
}

final class SearchResultsRepository: SearchResultsRepositoryProtocol {
 
    private let webService: WebService
    
    init(webService: WebService){
        self.webService = webService
    }
    
    func searchResults(withQuery query: String, onResults: @escaping ([Artist]) -> Void) {
        webService.load(Page<Artist>.self, from: .searchResult(query: query), onSuccess: { (result: Page<Artist>) in
            onResults(result.results)
        }) { (error: Error) in
            print(error)
        }
    }
    
    func loadDiscography(forArtist id: String, onResults: @escaping ([DiscographyResult]) -> Void) {
        webService.load(Page<DiscographyResult>.self, from: .discography(id: id), onSuccess: { (result: Page<DiscographyResult>) in
            onResults(result.results)
        }) { (error: Error) in
            print(error)
        }
    }
}
