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

    // MARK: - Properties
    
    var viewController: UIViewController {
        switch self {
            case .catalog:
                return CatalogViewController()
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
                return UIImage(systemName: "heart.fill")!
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
