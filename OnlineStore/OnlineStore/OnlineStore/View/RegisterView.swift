//
//  RegisterView.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 18.09.2021.
//

import UIKit

final class RegisterView: UIView {

    // MARK: - Properties

    let registerLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 30))
        label.textColor = .black
        label.text = "Регистрация"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .left
        return label
    }()

    let userName: UITextField = {
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
        textField.tag = 0
        textField.text = nil
        return textField
    }()

    let loginTextField: UITextField = {
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
        textField.tag = 1
        textField.text = nil
        return textField
    }()

    let passwordTextField: UITextField = {
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
        textField.tag = 2
        textField.text = nil
        return textField
    }()

    let secondPassword: UITextField = {
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
        textField.tag = 3
        textField.text = nil
        return textField
    }()

    var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 60, height: 40))
        button.backgroundColor = UIColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        button.setTitle("Зарегистрироваться", for: .normal)
        button.tintColor = .black
        button.addShadow()
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(touchDownButton), for: .touchDown)
        return button
    }()

    private var imageOfPerson: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Личный кабинет")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()

    var actionOnButtonTap: (() -> Void)?

    // MARK: - function

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - function

    @objc fileprivate func touchDownButton() {
        actionOnButtonTap?()
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
            addSubview($0)
            $0.toAutoLayout()
        }
        NSLayoutConstraint.activate([
            imageOfPerson.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            imageOfPerson.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageOfPerson.heightAnchor.constraint(equalToConstant: 100),
            imageOfPerson.widthAnchor.constraint(equalToConstant: 100),

            registerLabel.topAnchor.constraint(equalTo: imageOfPerson.bottomAnchor, constant: 5),
            registerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            userName.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 20),
            userName.centerXAnchor.constraint(equalTo: centerXAnchor),
            userName.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            userName.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),

            loginTextField.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 20),
            loginTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            loginTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),

            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            passwordTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),

            secondPassword.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            secondPassword.centerXAnchor.constraint(equalTo: centerXAnchor),
            secondPassword.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            secondPassword.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),

            loginButton.topAnchor.constraint(equalTo: secondPassword.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 50),
            loginButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -50)
        ])
        super.updateConstraints()
    }
}
