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
}

final class SearchResultsRepository: SearchResultsRepositoryProtocol {
 
    private let webService: WebService
    
    init(webService: WebService){
        self.webService = webService
    }
    
    func searchResults(withQuery query: String, onResults: @escaping ([Artist]) -> Void) {
        webService.load(from: .searchResult(query: query), onSuccess: { (result: SearchResult) in
            print("Search Repository state: \(result.results)")
            onResults(result.results)
        }) { (error: Error) in
            print(error)
        }
    }
}
