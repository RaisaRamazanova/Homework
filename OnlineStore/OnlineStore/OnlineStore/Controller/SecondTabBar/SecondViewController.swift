//
//  SecondViewController.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 30.08.2021.
//

import UIKit

final class SecondViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Properties

    private let service = KeychainService()
    private let mainView = SecondView()

    // MARK: - Life Cycle

    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Профиль"
        self.view.backgroundColor = UIColor(#colorLiteral(red: 0.8956577182, green: 0.8958080411, blue: 0.8956379294, alpha: 1))

        mainView.loginTextField.delegate = self
        mainView.passwordTextField.delegate = self
        setActions()
        self.navigationController?.isNavigationBarHidden = true

        if UserDefaults.standard.bool(forKey: "isUserLogin") == true {
            let name = UserDefaults.standard.object(forKey: "lastName") as? String ?? "Name"
            let loginVC = LoginViewController(userLogin: name)
            self.navigationController?.pushViewController(loginVC, animated: false)
        }
    }

    // MARK: - function

    private func setActions() {
        mainView.actionOnButtonTap1 = {
            self.touchDownButton()
        }
        mainView.actionOnButtonTap2 = {
            self.registerUser()
        }
    }

    // переходим к следующему textField принажатии на return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
         nextField.becomeFirstResponder()
      } else {
         textField.resignFirstResponder()
      }
      return false
    }

    private func touchDownButton() {
        view.animateDownView(self.mainView.loginButton)
        view.animateUpView(self.mainView.loginButton)
        if mainView.loginTextField.text == "" || mainView.passwordTextField.text == "" {
            Alert.alert(viewController: self, title: "Некорректные данные", message: "Введите логин и пароль")
        }
        if mainView.loginTextField.text != "" && mainView.passwordTextField.text != "" {
            let password: String? = service.object(for: GenericPassword(key: mainView.loginTextField.text!))
            if password == nil {
                Alert.alert(viewController: self, title: "Нет такого пользователя", message: "Зарегистрируйтесь")
            }
            if password != mainView.passwordTextField.text {
                Alert.alert(viewController: self, title: "Неверный пароль", message: "Попробуйте еще раз")
            }
            if password != nil {
                UserDefaults.standard.set(true, forKey: "isUserLogin")
                UserDefaults.standard.set(mainView.loginTextField.text!, forKey: "lastName")
                let loginVC = LoginViewController(userLogin: mainView.loginTextField.text!)
                self.navigationController?.pushViewController(loginVC, animated: true)
            }
        }
    }

    private func registerUser() {
        let detailVC = RegisterViewController()
        let navigationVC = UINavigationController(rootViewController: detailVC)
        let cancelButton = UIBarButtonItem(title: "Отмена", style: .plain, target: self, action: #selector(self.hideDetailVC))
        detailVC.navigationItem.leftBarButtonItem = cancelButton

        // Презентуем то, что получилось
        self.present(navigationVC, animated: true, completion: nil)
    }

    @objc private func hideDetailVC() {
        dismiss(animated: true, completion: nil)
    }
}
