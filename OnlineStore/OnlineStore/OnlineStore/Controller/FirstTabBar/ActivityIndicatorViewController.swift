//
//  ActivityIndicatorViewController.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 05.09.2021.
//

import UIKit

protocol ActivityIndicatorProtocol {
    static func startAnimating(in viewController: UIViewController)
    static func stopAnimating(in viewController: UIViewController)
    static func stopAnimating()
}

final class ActivityIndicatorViewController: UIViewController, ActivityIndicatorProtocol {
        
    private var activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.alpha = 0.7
        view.addSubview(activityIndicator)
        activityIndicator.center = view.center
        activityIndicator.color = .white
        activityIndicator.startAnimating()
    }
    
    // Презентует модально поверх всего экрана полупрозрачный вью контроллер с работающим активити индикатором:
    static func startAnimating(in viewController: UIViewController) {
        DispatchQueue.main.async {
            let activityVC = ActivityIndicatorViewController()
            activityVC.modalPresentationStyle = .overFullScreen
            viewController.navigationController?.present(activityVC, animated: false, completion: nil)
        }
    }
    
    static func stopAnimating(in viewController: UIViewController) {
        if viewController.navigationController?.presentedViewController is ActivityIndicatorViewController {
            viewController.navigationController?.dismiss(animated: false, completion: nil)
        }
    }
    
    // Выключает анимацию активити индикатора на корневом вью
    static func stopAnimating() {
        DispatchQueue.main.async {
            if let navigationController = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController as? UINavigationController {
                navigationController.dismiss(animated: true, completion: nil)
            }
        }
    }
}
