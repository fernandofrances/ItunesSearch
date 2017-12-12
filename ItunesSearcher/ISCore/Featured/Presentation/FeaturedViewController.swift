//
//  FeaturedViewController.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 12/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import UIKit

class FeaturedViewController: UIViewController {
    // MARK: - Outlets
    // View outlets here
    
    // MARK: - Properties
    
    private let presenter: FeaturedPresenter
    
    // MARK: - Initialization
    
    init(presenter: FeaturedPresenter){
        self.presenter = presenter
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.didLoad()
    }

}

extension FeaturedViewController: FeaturedView{
    func setArtistsHeaderTitle(_ title: String) {
        //Title for artists header
    }
    
    func setAlbumsHeaderTitle(_ title: String) {
        //Title for albums header
    }
    
    func update(with artists: [Artist]) {
        //Update view with artists
    }
    
    func update(with albums: [Album]) {
        //Update view with albums
    }
    
    
}
