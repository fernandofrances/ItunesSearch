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
    private let dateFormatter: DateFormatter
    
    init(dateFormatter: DateFormatter){
        self.dateFormatter = dateFormatter
    }
    func present(album: Album, in cell: AlbumCell){
        cell.thumbnail.layer.cornerRadius = 10
        cell.thumbnail.kf.setImage(with: URL(string:album.artworkUrl100))
        cell.title.text = album.collectionName
        if let date = dateFormatter.date(from: album.releaseDate) {
            let calendar = Calendar.current
            let year = calendar.component(.year, from: date)
            cell.date.text = String(year)
        }
        
    }
}
