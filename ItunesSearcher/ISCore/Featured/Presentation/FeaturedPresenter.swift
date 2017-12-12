//
//  FeaturedPresenter.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 12/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

protocol FeaturedView: class {
    var title: String? { get set }
    
    func setArtistsHeaderTitle(_ title: String)
    func setAlbumsHeaderTitle(_ title: String)
    
    func update(with artists: [Artist])
    func update(with albums: [Album])
}

final class FeaturedPresenter {
    private let repository: FeaturedRepositoryProtocol
    weak var view: FeaturedView?
    
    init(repository: FeaturedRepositoryProtocol){
        self.repository = repository
    }
    
    func didLoad(){
        view?.title = NSLocalizedString("Featured", comment: "")
        view?.setAlbumsHeaderTitle(NSLocalizedString("TOP ALBUMS", comment: ""))
        view?.setArtistsHeaderTitle(NSLocalizedString("TOP ARTISTS", comment: ""))
        
        loadContents()
    }
}

private extension FeaturedPresenter {
    func loadContents() {
        //Call the repository and load featured artists and albums
    }
}
