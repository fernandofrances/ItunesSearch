//
//  AlbumCell.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 13/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    override func prepareForReuse() {
        thumbnail.image = nil
    }
    
    class func cellId() -> String {
        return "AlbumCellID"
    }
    
    class func cellHeight() -> Float{
        return 80.0
    }
}

