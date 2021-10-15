//
//  RegisterViewController.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 07.09.2021.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Properties

    private let service = KeychainService()
    private let mainView = RegisterView()

    // MARK: - Life Cycle

    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setActions()
        view.backgroundColor = UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        navigationController?.navigationBar.barTintColor = UIColor(#colorLiteral(red: 0.5601426959, green: 0.8468149304, blue: 0.9041565061, alpha: 1))
        mainView.userName.delegate = self
        mainView.loginTextField.delegate = self
        mainView.passwordTextField.delegate = self
        mainView.secondPassword.delegate = self
    }

    // MARK: - function

    private func setActions() {
        mainView.actionOnButtonTap = {
            self.touchDownButton()
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
        if mainView.loginTextField.text == "" || mainView.passwordTextField.text == "" || mainView.secondPassword.text == "" || mainView.userName.text == "" {
            Alert.alert(viewController: self, title: "Некорректные данные", message: "Введите логин и пароль")
        }
        if mainView.loginTextField.text != "" && mainView.passwordTextField.text != "" && mainView.secondPassword.text != "" && mainView.userName.text != "" {
            if mainView.passwordTextField.text == mainView.secondPassword.text {
                _ = service.save(value: mainView.passwordTextField.text, queryItem: GenericPassword(key: mainView.loginTextField.text!))
                UserDefaults.standard.set(mainView.userName.text, forKey: mainView.loginTextField.text!)
                dismiss(animated: true, completion: nil)
            } else {Alert.alert(viewController: self, title: "Пароли не совпадают", message: "Повторите попытку")}
        }
    }
}
