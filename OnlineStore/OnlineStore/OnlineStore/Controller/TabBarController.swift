//
//  TabBarController.swift
//  OnlineStore
//
//  Created by Рамазанова Раисат on 02.08.2021.
//

import UIKit

final class TabBarController: UITabBarController {

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        makeTabBar()
    }

    // MARK: - Private Methods

    private func makeTabBar() {
        let secondVC = UINavigationController.init(rootViewController: SecondViewController())
        secondVC.view.backgroundColor = .white
        secondVC.tabBarItem.title = "Профиль"
        secondVC.tabBarItem.image = UIImage(systemName: "person")

        let firstVC = UINavigationController.init(rootViewController: FirstViewController())
        firstVC.tabBarItem.title = "Каталог"
        firstVC.tabBarItem.image = UIImage(systemName: "book")

        let thirdVC = UINavigationController.init(rootViewController: ThirdViewController())
        thirdVC.view.backgroundColor = .white
        thirdVC.tabBarItem.title = "Корзина"
        thirdVC.tabBarItem.image = UIImage(systemName: "bag")
        viewControllers = [firstVC, secondVC, thirdVC]
    }
}
