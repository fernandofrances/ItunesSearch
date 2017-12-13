//
//  SearchCell.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 12/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {
   
    
    @IBOutlet weak var secondAlbum: UIImageView!
    @IBOutlet weak var firstAlbum: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var more: UILabel!
    
    var artist: Artist?
    
    override func prepareForReuse() {
        secondAlbum.image = #imageLiteral(resourceName: "defaultLight")
        firstAlbum.image = #imageLiteral(resourceName: "defaultDark")
        more.isHidden = true
    }
    class func identifier() -> String {
        return "SearchCellID"
    }
    class func height() -> Float {
        return 150
    }
    
}
