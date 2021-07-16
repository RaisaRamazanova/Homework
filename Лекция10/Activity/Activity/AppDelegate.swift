//
//  AppDelegate.swift
//  Activity
//
//  Created by Дмитрий Рудановский on 14.07.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let viewController = ViewController(nibName: nil, bundle: nil)
        let navigationController = UINavigationController(rootViewController: viewController)
        

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()

        return true
    }


}

