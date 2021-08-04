//
//  TabBarController.swift
//  OnlineStore
//
//  Created by Рамазанова Раисат on 02.08.2021.
//

import UIKit

class TabBarController: UITabBarController {
    // MARK: - Properties
        
//    private let myTabBar = CustomTabBar() // создаем кастомный tabBar
    private let tabItems: [TabItem] = [.catalog, .profile, .favourite]
    private let middleButtonDiameter: CGFloat = 42
    private let redColor: UIColor = UIColor(red: 254.0 / 255.0, green: 116.0 / 255.0, blue: 96.0 / 255.0, alpha: 1.0)
    private let greenColor: UIColor = UIColor(red: 102.0 / 255.0, green: 166.0 / 255.0, blue: 54.0 / 255.0, alpha: 1.0)
    private lazy var middleButton: UIButton = {
        let middleButton = UIButton()
        middleButton.layer.cornerRadius = middleButtonDiameter / 2
        middleButton.backgroundColor = redColor
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        return middleButton
    }()
    private lazy var heartImageView: UIImageView = {
        let heartImageView = UIImageView()
        heartImageView.image = UIImage(systemName: "person")
        heartImageView.tintColor = .white
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        return heartImageView
    }()

    // MARK: - Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }

    // MARK: - Private Methods
    
    @objc
    private func didPressMiddleButton() {
        selectedIndex = 1
        middleButton.backgroundColor = greenColor
    }
    
    private func makeUI() {
//        var controllers: [UIViewController] =  []
//        tabBar.addSubview(middleButton)
//        middleButton.addSubview(heartImageView)
        
//        NSLayoutConstraint.activate([
//            middleButton.heightAnchor.constraint(equalToConstant: middleButtonDiameter),
//            middleButton.widthAnchor.constraint(equalToConstant: middleButtonDiameter),
//            middleButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
//            middleButton.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -10)
//        ])
//        middleButton.addTarget(self, action: #selector(didPressMiddleButton), for: .touchUpInside)
//
//        NSLayoutConstraint.activate([
//            heartImageView.heightAnchor.constraint(equalToConstant: 15),
//            heartImageView.widthAnchor.constraint(equalToConstant: 18),
//            heartImageView.centerXAnchor.constraint(equalTo: middleButton.centerXAnchor),
//            heartImageView.centerYAnchor.constraint(equalTo: middleButton.centerYAnchor)
//        ])

//        for item in tabItems {
//            let vc = item.viewController
//            vc.view.backgroundColor = item.color
//            vc.tabBarItem.title = item.displayTitle
//            vc.tabBarItem.image = item.icon
//            controllers.append(vc)
//        }
//        viewControllers = controllers
//
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .yellow
        firstVC.tabBarItem.title = "First VC"
        firstVC.tabBarItem.image = UIImage(systemName: "1.circle")

        let middleVC = UIViewController()
        middleVC.view.backgroundColor = .green
        middleVC.tabBarItem.title = "Middle VC"

        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .blue
        secondVC.tabBarItem.title = "Second VC"
        secondVC.tabBarItem.image = UIImage(systemName: "2.circle")

        viewControllers = [firstVC, middleVC, secondVC]
    }
}

// MARK: - UITabBarControllerDelegate

extension TabBarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let selectedIndex = self.tabBar.items?.firstIndex(of: item) // 1
        if selectedIndex != 1 {
            middleButton.backgroundColor = redColor
        } else {
            middleButton.backgroundColor = greenColor
        }
    }
}