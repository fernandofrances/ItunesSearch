//
//  SearchAssembly.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 12/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

final class SearchAssembly {
    private let webServiceAssembly: WebServiceAssembly
    init(webServiceAssembly: WebServiceAssembly){
        self.webServiceAssembly = webServiceAssembly
    }
    
    func searchNavigator() -> SearchNavigator {
        return PhoneSearchNavigator(viewControllerProvider: self)
    }
    
    func presenter() -> SearchResultsPresenter {
        return SearchResultsPresenter(repository: repository())
    }
    
    func repository() -> SearchResultsRepositoryProtocol{
        return SearchResultsRepository(webService: webServiceAssembly.webService)
    }
    
}

extension SearchAssembly: SearchResultsViewControllerProvider{
    func searchResultsViewController() -> SearchResultsViewController {
        return SearchResultsViewController(presenter: presenter())
    }
}
