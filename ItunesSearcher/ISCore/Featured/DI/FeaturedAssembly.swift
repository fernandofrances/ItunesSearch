//
//  FeaturedAssembly.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 12/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

final class FeaturedAssembly {
    private let webServiceAssembly: WebServiceAssembly
    private let searchAssembly: SearchAssembly
    
    init(webServiceAssembly: WebServiceAssembly, searchAssembly: SearchAssembly){
        self.webServiceAssembly = webServiceAssembly
        self.searchAssembly = searchAssembly
    }
    
    public func viewController() -> FeaturedViewController {
        return FeaturedViewController(presenter: presenter(), searchNavigator: searchAssembly.searchNavigator())
    }
    
    func presenter() -> FeaturedPresenter{
        return FeaturedPresenter(repository: repository())
    }
    
    func repository() -> FeaturedRepositoryProtocol {
        return FeaturedRepository(webService: webServiceAssembly.webService)
    }
}
