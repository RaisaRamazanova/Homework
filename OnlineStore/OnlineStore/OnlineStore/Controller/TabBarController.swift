//
//  TabBarController.swift
//  OnlineStore
//
//  Created by Рамазанова Раисат on 02.08.2021.
//

import UIKit

class TabBarController: UITabBarController {

    var myTabBar = CustomTabBar()
    
    let tabItems: [TabItem] = [.catalog, .profile, .favourite]
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        makeUI()
    }
    
    @objc
    private func didPressMiddleButton() {
        selectedIndex = 1
        middleButton.backgroundColor = greenColor
    }
    
    private func makeUI() {
        self.view.addSubview(myTabBar)
        self.myTabBar.addSubview(middleButton)
        middleButton.addSubview(heartImageView)
        
        NSLayoutConstraint.activate([
            middleButton.heightAnchor.constraint(equalToConstant: middleButtonDiameter),
            middleButton.widthAnchor.constraint(equalToConstant: middleButtonDiameter),
            middleButton.centerXAnchor.constraint(equalTo: myTabBar.centerXAnchor),
            middleButton.topAnchor.constraint(equalTo: myTabBar.topAnchor, constant: -10)
        ])
        middleButton.addTarget(self, action: #selector(didPressMiddleButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            heartImageView.heightAnchor.constraint(equalToConstant: 15),
            heartImageView.widthAnchor.constraint(equalToConstant: 18),
            heartImageView.centerXAnchor.constraint(equalTo: middleButton.centerXAnchor),
            heartImageView.centerYAnchor.constraint(equalTo: middleButton.centerYAnchor)
        ])
        
        var controllers: [UIViewController] =  []
        
        for item in tabItems {
            if item != .profile {
                let vc = item.viewController
                vc.view.backgroundColor = item.color
                vc.tabBarItem.title = item.displayTitle
                vc.tabBarItem.image = item.icon
                controllers.append(vc)
            }
        }
        viewControllers = controllers
    }
}

// MARK: - UITabBarControllerDelegate

extension TabBarController: UITabBarControllerDelegate {
    override func tabBar(_ myTabBar: UITabBar, didSelect item: UITabBarItem) {
        let selectedIndex = self.tabBar.items?.firstIndex(of: item) // 1
        if selectedIndex != 1 {
            middleButton.backgroundColor = redColor
        } else {
            middleButton.backgroundColor = greenColor
        }
    }
}
