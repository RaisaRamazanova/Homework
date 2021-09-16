//
//  Alert.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 06.09.2021.
//

import UIKit

protocol Goback {
    func goBackToPreviousVC()
}

final class CustomClass: RegisterViewController, Goback {

    func goBackToPreviousVC() {
        navigationController?.popViewController(animated: true)
    }
}

final class Alert {

    // Создает базовый алерт
    class func alert(viewController: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true)
    }
}
