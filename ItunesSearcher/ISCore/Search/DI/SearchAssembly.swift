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
    private let detailAssembly: DetailAsembly
    init(webServiceAssembly: WebServiceAssembly, detailAssembly: DetailAsembly){
        self.webServiceAssembly = webServiceAssembly
        self.detailAssembly = detailAssembly
    }
    
    func searchNavigator() -> SearchNavigator {
        return PhoneSearchNavigator(viewControllerProvider: self)
    }
    
    func presenter() -> SearchResultsPresenter {
        return SearchResultsPresenter(repository: repository(), detailNavigator: detailAssembly.detailNavigator())
    }
    
    func resultPresenter() -> SearchResultPresenter {
        return SearchResultPresenter()
    }
    
    func repository() -> SearchResultsRepositoryProtocol{
        return SearchResultsRepository(webService: webServiceAssembly.webService)
    }
    
}

extension SearchAssembly: SearchResultsViewControllerProvider{
    func searchResultsViewController() -> SearchResultsViewController {
        return SearchResultsViewController(searchResultsPresenter: presenter(), searchResultPresenter: resultPresenter())
    }
}
