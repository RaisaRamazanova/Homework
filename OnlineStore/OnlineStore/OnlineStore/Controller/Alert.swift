//
//  Alert.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 06.09.2021.
//

import UIKit

protocol Goback {
    func GoBackToPreviousVC()
}

class CustomClass: RegisterViewController,Goback {

    func GoBackToPreviousVC(){
        navigationController?.popViewController(animated: true)
    }
}

final class Alert {
    
    // Создает базовый алерт
    class func alert(vc: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
        vc.present(alert, animated: true)
    }
}

