//
//  DetailViewController.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 13/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import UIKit

protocol DetailViewControllerProvider: class {
    func detailViewController(artist: Artist) -> UIViewController
}
class DetailViewController: UITableViewController {

    private let presenter: DetailPresenter
    private let albumPresenter: AlbumPresenter
    private var albums: [DiscographyResult] = []
    
    // Mark: - Initialization
    init(presenter: DetailPresenter, albumPresenter: AlbumPresenter){
        self.presenter = presenter
        self.albumPresenter = albumPresenter
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        presenter.view = self
        presenter.didLoad()
    }

    //MARK: - TableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(AlbumCell.cellHeight())
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AlbumCell = tableView.dequeueReusableCell(withIdentifier: AlbumCell.cellId(), for: indexPath) as! AlbumCell
        let discographyResult = albums[indexPath.row]
        switch discographyResult {
        case let .album(album):
            albumPresenter.present(album: album, in: cell)
        default:
            print("Not an album")
        }
        
        return cell
    }
    
    // MARK: - TableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

private extension DetailViewController{
    func setUpView() {
        tableView.register( UINib(nibName: "AlbumCell", bundle: nil), forCellReuseIdentifier: AlbumCell.cellId())
    }
}

extension DetailViewController: DetailView {
    func update(with albums: [DiscographyResult]) {
        self.albums = albums
        tableView.reloadData()
    }
    
    
}
