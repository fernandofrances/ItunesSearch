//
//  SearchResultPresenter.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 12/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import Foundation
import Kingfisher

/// presents search results in cells
final class SearchResultPresenter{
    func present(artist: Artist, in cell: SearchCell) {
        cell.artist = artist
        cell.title.text = artist.artistName + " • \(artist.primaryGenreName ?? "")"
        cell.firstAlbum.layer.cornerRadius = 10
        cell.secondAlbum.layer.cornerRadius = 10
      
    }
    
    func present(discographyResult: [DiscographyResult], in cell: SearchCell){
        if discographyResult.count > 2 {cell.more.isHidden = false}
        switch discographyResult[0] {
        case let .album(album):
            cell.firstAlbum.kf.setImage(with: URL(string:album.artworkUrl100))
        default:
            print("not an album")
        }
        if discographyResult.count>1{
            switch discographyResult[1]{
            case let .album(album):
                cell.secondAlbum.kf.setImage(with: URL(string: album.artworkUrl100))
            default:
                print("not an album")
            }
        }
        
    }
}
