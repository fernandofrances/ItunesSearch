//
//  DetailPresenter.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 13/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation

protocol DetailView: class{
    var title: String? { get set }
    func update(with albums: [DiscographyResult])
}

final class DetailPresenter {
    
    private let repository: DetailRepositoryProtocol
    weak var view: DetailView?
    init(repository: DetailRepositoryProtocol){
        self.repository = repository
    }
    
    func didLoad() {
        update()
    }
    
}

extension DetailPresenter {
    func update() {
        view?.title = repository.artistToShow().artistName
        view?.update(with: repository.artistToShow().discography ?? [])
    }
}
