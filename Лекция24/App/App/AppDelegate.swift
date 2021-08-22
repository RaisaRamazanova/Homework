//
//  AppDelegate.swift
//  App
//
//  Created by Раисат Рамазанова on 22.08.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var networkService: NetworkService?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let networkService = NetworkService()
        let rootViewController = ViewController(networkService: networkService)
        self.networkService = networkService
        
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        return true
    }
}

