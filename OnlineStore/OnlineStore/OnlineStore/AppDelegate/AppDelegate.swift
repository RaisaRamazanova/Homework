//
//  AppDelegate.swift
//  OnlineStore
//
//  Created by Рамазанова Раисат on 02.08.2021.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController.init(rootViewController: TabBarController())
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        navigationController.title = "hbec"
        self.window?.makeKeyAndVisible()

        return true
    }
}

