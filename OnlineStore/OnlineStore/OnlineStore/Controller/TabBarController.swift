//
//  TabBarController.swift
//  OnlineStore
//
//  Created by Рамазанова Раисат on 02.08.2021.
//

import UIKit

class TabBarController: UITabBarController {
    // MARK: - Properties


    // MARK: - Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Pop"
    }

    // MARK: - Private Methods

    private func makeUI() {
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .yellow
        firstVC.tabBarItem.title = "Профиль"
        firstVC.tabBarItem.image = UIImage(systemName: "person")

        let middleVC = FirstViewController()
        middleVC.tabBarItem.title = "Каталог"
        middleVC.tabBarItem.image = UIImage(systemName: "book")

        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .blue
        secondVC.tabBarItem.title = "Корзина"
        secondVC.tabBarItem.image = UIImage(systemName: "bag")
        viewControllers = [middleVC, firstVC, secondVC]
    }
}
