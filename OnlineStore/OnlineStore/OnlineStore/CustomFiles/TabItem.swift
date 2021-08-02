//
//  TabItem.swift
//  OnlineStore
//
//  Created by Рамазанова Раисат on 02.08.2021.
//

import UIKit

enum TabItem: String, CaseIterable {
    
    case catalog = "Каталог"
    case profile = "Профиль"
    case favourite = "Избранное"
    
    var viewController: UIViewController {
        switch self {
            case .catalog:
                return UIViewController()
            case .profile:
                return UIViewController()
            case .favourite:
                return UIViewController()
        }
    }

    var icon: UIImage {
        switch self {
            case .catalog:
                return UIImage(systemName: "1.circle")!
            case .profile:
                return UIImage(systemName: "person")!
            case .favourite:
                return UIImage(systemName: "2.circle")!
        }
    }
    
    var color: UIColor {
        switch self {
            case .catalog:
                return .yellow
            case .profile:
                return .green
            case .favourite:
                return .blue
        }
    }
    
    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}
