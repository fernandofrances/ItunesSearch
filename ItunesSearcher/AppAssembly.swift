//
//  AppAssembly.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 11/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import UIKit
final class AppAssembly {
    private(set) lazy var window = UIWindow(frame: UIScreen.main.bounds)
    private(set) lazy var navigationController = UINavigationController()
    private(set) lazy var coreAssembly = CoreAssembly(navigationController: navigationController)
}
