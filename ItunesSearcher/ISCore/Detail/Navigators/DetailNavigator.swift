//
//  DetailNavigator.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 13/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import UIKit

final class DetailNavigator{
    
    private let navigationController: UINavigationController
    private unowned let viewControllerProvider: DetailViewControllerProvider
    
    init(navigationController: UINavigationController, viewControllerProvider: DetailViewControllerProvider){
        self.navigationController = navigationController
        self.viewControllerProvider = viewControllerProvider
    }
    
    func showDetail(artist: Artist) {
        let viewController = viewControllerProvider.detailViewController(artist: artist)
        navigationController.pushViewController(viewController, animated: true)
    }
}
