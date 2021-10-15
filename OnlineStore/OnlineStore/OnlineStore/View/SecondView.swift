//
//  SecondView.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 18.09.2021.
//

import UIKit

final class SecondView: UIView {

    // MARK: - Properties

    let registerLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 30))
        label.textColor = .black
        label.text = "Вход"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .left
        return label
    }()

    let loginTextField: UITextField = {
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
        textField.tag = 0
        textField.text = nil
        return textField
    }()

    let passwordTextField: UITextField = {
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
        textField.tag = 1
        textField.text = nil
        return textField
    }()

    let alternativeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 30))
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "или"
        label.textAlignment = .left
        return label
    }()

    let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        button.setTitle("Войти", for: .normal)
        button.tintColor = .black
        button.addShadow()
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(touchDownButton), for: .touchDown)
        return button
    }()

    let registrationButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        button.setTitle("Регистрация", for: .normal)
        button.tintColor = .black
        button.addShadow()
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(registerUser), for: .touchUpInside)
        return button
    }()

    var actionOnButtonTap1: (() -> Void)?
    var actionOnButtonTap2: (() -> Void)?

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
        actionOnButtonTap1?()
    }

    @objc fileprivate func registerUser() {
        actionOnButtonTap2?()
    }

    // создаем constraint и добавляем Subview
    private func setupLayout() {
        [registerLabel,
         loginTextField,
         passwordTextField,
         alternativeLabel,
         loginButton,
         registrationButton].forEach {
            addSubview($0)
            $0.toAutoLayout()
        }

        NSLayoutConstraint.activate([
            registerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            registerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            loginTextField.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 30),
            loginTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            loginTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),

            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 30),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            passwordTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),

            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 50),
            loginButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -50),

            alternativeLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
            alternativeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            registrationButton.topAnchor.constraint(equalTo: alternativeLabel.bottomAnchor, constant: 30),
            registrationButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            registrationButton.heightAnchor.constraint(equalToConstant: 40),
            registrationButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 50),
            registrationButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -50)
        ])
        super.updateConstraints()
    }
}
