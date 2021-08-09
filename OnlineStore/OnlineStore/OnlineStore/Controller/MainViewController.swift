//
//  TabBarController.swift
//  OnlineStore
//
//  Created by Рамазанова Раисат on 02.08.2021.
//

import UIKit

class TabBarController: UITabBarController {
    // MARK: - Properties

    var myTabBar = TabBarCustomizator()

    // MARK: - Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTabBar.tabBar = tabBar
        myTabBar.customize()
        makeUI()
    }

    // MARK: - Private Methods

    private func makeUI() {
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .yellow
        firstVC.tabBarItem.title = "Профиль"
        firstVC.tabBarItem.image = UIImage(systemName: "person")

        let middleVC = FirstViewController()

        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .blue
        secondVC.tabBarItem.title = "Избранное"
        secondVC.tabBarItem.image = UIImage(systemName: "heart")

        viewControllers = [firstVC, middleVC, secondVC]
    }
}
