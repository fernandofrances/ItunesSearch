//
//  DetailAssembly.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 13/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import UIKit

final class DetailAsembly {
    private let navigationController: UINavigationController
    private let webServiceAssembly: WebServiceAssembly
    
    init(navigationController: UINavigationController, webServiceAssembly: WebServiceAssembly){
        self.navigationController = navigationController
        self.webServiceAssembly = webServiceAssembly
    }
    
    private func presenter(artist: Artist) -> DetailPresenter {
        return DetailPresenter(repository: repository(artist:artist))
    }
    
    private func albumPresenter() -> AlbumPresenter {
        return AlbumPresenter(dateFormatter: webServiceAssembly.dateFormatter)
    }
    
    private func repository(artist: Artist) -> DetailRepository {
        return DetailRepository(artist: artist)
    }
    
    public func detailNavigator() -> DetailNavigator {
        return DetailNavigator(navigationController: navigationController, viewControllerProvider: self)
    }
}

extension DetailAsembly: DetailViewControllerProvider {
    func detailViewController(artist: Artist) -> UIViewController {
        return DetailViewController(presenter: presenter(artist:artist), albumPresenter: albumPresenter())
    }
}
