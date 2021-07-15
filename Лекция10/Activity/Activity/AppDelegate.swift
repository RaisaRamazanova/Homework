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
        // Override point for customization after application launch.
        
        let viewController = ViewController(nibName: nil, bundle: nil)
        let navigationController = UINavigationController(rootViewController: viewController)

//        UINavigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
//
        
//        func addTappe() {
//            print("123")
//        }
//
//        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTappe()))
//        UINavigationItem.setLeftBarButton(add)
//
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()

        return true
    }


}

