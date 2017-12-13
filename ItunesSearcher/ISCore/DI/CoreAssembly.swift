//
//  CoreAssembly.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 11/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import UIKit

final class CoreAssembly {
    private(set) lazy var webServiceAssembly = WebServiceAssembly()
    private(set) lazy var detailAssembly = DetailAsembly(navigationController: navigationController, webServiceAssembly: webServiceAssembly)
    private(set) lazy var searchAssembly = SearchAssembly(webServiceAssembly: webServiceAssembly, detailAssembly: detailAssembly)
    public private(set) lazy var featuredAssembly = FeaturedAssembly(webServiceAssembly: webServiceAssembly, searchAssembly: searchAssembly)
    private let navigationController: UINavigationController
    public init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
}
