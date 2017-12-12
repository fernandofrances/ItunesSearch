//
//  AppDelegate.swift
//  ItunesSearcher
//
//  Created by Fernando Frances on 11/12/2017.
//  Copyright © 2017 Fernando Frances. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let appAsssembly = AppAssembly()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let initalViewController = appAsssembly.coreAssembly.featuredAssembly.viewController()
        appAsssembly.window.rootViewController = appAsssembly.navigationController
        appAsssembly.navigationController.pushViewController(initalViewController, animated: false)
        appAsssembly.window.makeKeyAndVisible()
        return true
    }


}

