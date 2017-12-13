//
//  SearchResultsViewController.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 12/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import UIKit

protocol SearchResultsViewControllerProvider: class {
    func searchResultsViewController() -> SearchResultsViewController
}

class SearchResultsViewController: UITableViewController {

    // MARK: - Properties
    private let searchResultPresenter :  SearchResultPresenter
    private let searchResultsPresenter: SearchResultsPresenter
    private var timer = Timer()
    private var results: [Artist] = []
    
    //MARK: - Initialization
    
    init(searchResultsPresenter: SearchResultsPresenter, searchResultPresenter: SearchResultPresenter){
        self.searchResultsPresenter = searchResultsPresenter
        self.searchResultPresenter = searchResultPresenter
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchResultsPresenter.view = self
        setUpView()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(SearchCell.height())
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchCell = tableView.dequeueReusableCell(withIdentifier: SearchCell.identifier(), for: indexPath) as! SearchCell
        let artist = results[indexPath.row]
        searchResultPresenter.present(artist: artist, in: cell)
        return cell
    }


}

extension SearchResultsViewController {
    func setUpView() {
        tableView.register(UINib(nibName: "SearchCell", bundle: nil),
                           forCellReuseIdentifier: SearchCell.identifier())
    }
}

extension SearchResultsViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text ?? ""
        if searchText.count > 0 {
            timer.invalidate()
            timer = Timer(timeInterval: 0.5, repeats: false, block: { _ in
                self.searchResultsPresenter.search(with: searchText)
            })
            RunLoop.main.add(timer, forMode: .commonModes)
        }
    }
}

extension SearchResultsViewController: SearchView {
    func update(with artists: [Artist]) {
        results = artists
        tableView.reloadData()
    }
}
