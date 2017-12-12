//
//  SearchCell.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 12/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {
   
    
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var title: UILabel!
    var artist: Artist?
    
    class func identifier() -> String {
        return "SearchCellID"
    }
    class func height() -> Float {
        return 100
    }
    
}
