//
//  AlbumPresenter.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 13/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import UIKit
import Kingfisher

final class AlbumPresenter {
    func present(album: Album, in cell: AlbumCell){
        cell.thumbnail.layer.cornerRadius = 10
        cell.thumbnail.kf.setImage(with: URL(string:album.artworkUrl100))
        cell.title.text = album.collectionName
        cell.date.text = String(album.releaseYear!)
    }
}
