//
//  SecondViewController.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 30.08.2021.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Properties
    
    private let service = KeychainService()

    private let registerLabel : UILabel = {
        let cl = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 30))
        cl.textColor = .black
        cl.text = "Вход"
        cl.font = UIFont.boldSystemFont(ofSize: 30)
        cl.textAlignment = .left
        return cl
    }()
    
    private let loginTextField : UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 60, height: 20))
        textField.textColor = .gray
        textField.backgroundColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Логин",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.text = nil
        return textField
    }()
    
    private let passwordTextField : UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 60, height: 20))
        textField.textColor = .gray
        textField.backgroundColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Пароль",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        textField.isSecureTextEntry = true 
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.text = nil
        return textField
    }()
    
    private let alternativeLabel : UILabel = {
        let cl = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 30))
        cl.textColor = .gray
        cl.font = UIFont.systemFont(ofSize: 20)
        cl.text = "или"
        cl.textAlignment = .left
        return cl
    }()
    
    private var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        button.setTitle("Войти", for: .normal)
        button.tintColor = .black
        button.addShadow()
        button.layer.cornerRadius = 6
        return button
    }()

    private var registrationButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        button.setTitle("Регистрация", for: .normal)
        button.tintColor = .black
        button.addShadow()
        button.layer.cornerRadius = 6
        return button
    }()

    // MARK: - Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Профиль"
        self.view.backgroundColor = UIColor(#colorLiteral(red: 0.8956577182, green: 0.8958080411, blue: 0.8956379294, alpha: 1))
        setupLayout()
        
        loginTextField.delegate = self
        loginTextField.tag = 0

        passwordTextField.delegate = self
        passwordTextField.tag = 1
        loginButton.addTarget(self, action: #selector(loginUser), for: .touchUpInside)
        registrationButton.addTarget(self, action: #selector(registerUser), for: .touchUpInside)

        self.navigationController?.isNavigationBarHidden = true
        
        if UserDefaults.standard.bool(forKey: "isUserLogin") == true {
            let name = UserDefaults.standard.object(forKey: "lastName") as? String ?? "Name"
            let loginVC = LoginViewController(userLogin: name)
            self.navigationController?.pushViewController(loginVC, animated: false)
        }
    }
    
    // MARK: - function
    
    // переходим к следующему textField принажатии на return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
         nextField.becomeFirstResponder()
      } else {
         textField.resignFirstResponder()
      }
      return false
    }
    
    @objc func loginUser() {
        if loginTextField.text == "" || passwordTextField.text == "" {
            Alert.alert(vc: self, title: "Некорректные данные", message: "Введите логин и пароль")
        }
        if loginTextField.text != "" && passwordTextField.text != "" {
            let password: String? = service.object(for: GenericPassword(key: loginTextField.text!))
            if password == nil {
                Alert.alert(vc: self, title: "Нет такого пользователя", message: "Зарегистрируйтесь")
            }
            if password != passwordTextField.text {
                Alert.alert(vc: self, title: "Неверный пароль", message: "Попробуйте еще раз")
            }
            if password != nil {
                UserDefaults.standard.set(true, forKey: "isUserLogin")
                UserDefaults.standard.set(loginTextField.text!, forKey: "lastName")
                let loginVC = LoginViewController(userLogin: loginTextField.text!)
                self.navigationController?.pushViewController(loginVC, animated: true)
            }
        }
    }
    
    @objc func registerUser() {
        showDetailScreen()
    }
    
    func showDetailScreen() {
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

    // создаем constraint и добавляем Subview
    private func setupLayout() {
        [registerLabel,
         loginTextField,
         passwordTextField,
         alternativeLabel,
         loginButton,
         registrationButton].forEach {
            view.addSubview($0)
            $0.toAutoLayout()
        }
        
        NSLayoutConstraint.activate([
            registerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            registerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginTextField.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 30),
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            loginTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 30),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            
            alternativeLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
            alternativeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            registrationButton.topAnchor.constraint(equalTo: alternativeLabel.bottomAnchor, constant: 30),
            registrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registrationButton.heightAnchor.constraint(equalToConstant: 40),
            registrationButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            registrationButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
        ])
    }
}
