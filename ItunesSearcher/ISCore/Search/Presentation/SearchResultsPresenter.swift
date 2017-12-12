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
}

final class SearchResultsPresenter {
    private let repository:  SearchResultsRepositoryProtocol
    weak var view: SearchView?
    
    init(repository: SearchResultsRepositoryProtocol){
        self.repository = repository
    }
}

extension SearchResultsPresenter {
    func search(with query: String){
        repository.searchResults(withQuery:query) { (artists: [Artist]) in
            self.view?.update(with: artists)
        }
    }
}
