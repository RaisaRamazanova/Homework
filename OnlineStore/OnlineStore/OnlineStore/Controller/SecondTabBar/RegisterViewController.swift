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
    private let registerLabel : UILabel = {
        let cl = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 30))
        cl.textColor = .black
        cl.text = "Регистрация"
        cl.font = UIFont.boldSystemFont(ofSize: 30)
        cl.textAlignment = .left
        return cl
    }()
    
    private let userName : UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 60, height: 20))
        textField.textColor = .gray
        textField.backgroundColor = .white
        textField.layer.borderColor = CGColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 1.0
        textField.attributedPlaceholder = NSAttributedString(string: "Ваше имя",
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
    
    private let loginTextField : UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 60, height: 20))
        textField.textColor = .gray
        textField.backgroundColor = .white
        textField.backgroundColor = UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        textField.layer.borderColor = CGColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 1.0
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
        textField.layer.borderColor = CGColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 1.0
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
    
    private let secondPassword: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 60, height: 20))
        textField.textColor = .gray
        textField.backgroundColor = .white
        textField.layer.borderColor = CGColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 1.0
        textField.attributedPlaceholder = NSAttributedString(string: "Повторите пароль",
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
    
    private var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 60, height: 40))
        button.backgroundColor = UIColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        button.setTitle("Зарегистрироваться", for: .normal)
        button.tintColor = .black
        button.addShadow()
        button.layer.cornerRadius = 6
        return button
    }()
    
    private var imageOfPerson: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Личный кабинет")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    // MARK: - override function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        view.backgroundColor = UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        navigationController?.navigationBar.barTintColor = UIColor(#colorLiteral(red: 0.5601426959, green: 0.8468149304, blue: 0.9041565061, alpha: 1))
        userName.delegate = self
        userName.tag = 0
        loginTextField.delegate = self
        loginTextField.tag = 1
        passwordTextField.delegate = self
        passwordTextField.tag = 2
        secondPassword.delegate = self
        secondPassword.tag = 3
        loginButton.addTarget(self, action: #selector(loginUser), for: .touchUpInside)
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
        if loginTextField.text == "" || passwordTextField.text == "" || secondPassword.text == "" || userName.text == "" {
            Alert.alert(vc: self, title: "Некорректные данные", message: "Введите логин и пароль")
        }
        if loginTextField.text != "" && passwordTextField.text != "" && secondPassword.text != "" && userName.text != "" {
            let _ = service.save(value: passwordTextField.text, queryItem: GenericPassword(key: loginTextField.text!))
            UserDefaults.standard.set(userName.text, forKey: loginTextField.text!)
            Alert.alert(vc: self, title: "Вы зарегистрировались, \(userName.text!)", message: "Войдите в систему теперь")
        }
    }
    
    // создаем constraint и добавляем Subview
    private func setupLayout() {
        [userName,
         registerLabel,
         loginTextField,
         passwordTextField,
         secondPassword,
         loginButton,
         imageOfPerson].forEach {
            view.addSubview($0)
            $0.toAutoLayout()
        }
        NSLayoutConstraint.activate([
            
            imageOfPerson.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            imageOfPerson.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageOfPerson.heightAnchor.constraint(equalToConstant: 100),
            imageOfPerson.widthAnchor.constraint(equalToConstant: 100),
            
            registerLabel.topAnchor.constraint(equalTo: imageOfPerson.bottomAnchor, constant: 5),
            registerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            userName.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 30),
            userName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            userName.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            
            loginTextField.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 30),
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            loginTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 30),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            
            secondPassword.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            secondPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondPassword.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            secondPassword.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            
            loginButton.topAnchor.constraint(equalTo: secondPassword.bottomAnchor, constant: 30),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
        ])
    }
}
