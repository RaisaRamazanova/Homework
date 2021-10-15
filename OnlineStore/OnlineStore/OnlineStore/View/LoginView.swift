//
//  LoginView.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 18.09.2021.
//

import UIKit

final class LoginView: UIView {

    // MARK: - Properties

    let registerLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 30))
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        label.text = "Привет"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .left
        return label
    }()

    let shinyRegisterLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 30))
        label.textColor = .white
        label.text = "Привет"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .left
        return label
    }()

    var unloginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 60, height: 40))
        button.backgroundColor = UIColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        button.setTitle("Выйти из профиля", for: .normal)
        button.tintColor = .black
        button.addShadow()
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(touchDownButton), for: .touchDown)
        button.addTarget(self, action: #selector(touchUpInsideButton), for: .touchUpInside)
        return button
    }()

    var imageOfPerson: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Профиль")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()

    var actionOnButtonTap1: (() -> Void)?
    var actionOnButtonTap2: (() -> Void)?

    @objc fileprivate func touchUpInsideButton() {
        actionOnButtonTap1?()
    }

    @objc fileprivate func touchDownButton() {
        actionOnButtonTap2?()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // создаем constraint и добавляем Subview
    private func setupLayout() {
        setupLayoutLabels()
        [imageOfPerson,
         unloginButton].forEach {
            addSubview($0)
            $0.toAutoLayout()
        }
        NSLayoutConstraint.activate([
            imageOfPerson.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 20),
            imageOfPerson.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageOfPerson.heightAnchor.constraint(equalToConstant: 200),
            imageOfPerson.widthAnchor.constraint(equalToConstant: 200),

            unloginButton.topAnchor.constraint(equalTo: imageOfPerson.bottomAnchor, constant: 100),
            unloginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            unloginButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 50),
            unloginButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -50),
            unloginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        super.updateConstraints()
    }
    
    private func setupLayoutLabels() {
        [registerLabel,
         shinyRegisterLabel].forEach {
            addSubview($0)
            $0.toAutoLayout()
        }

        NSLayoutConstraint.activate([
            registerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            registerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            shinyRegisterLabel.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            shinyRegisterLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        super.updateConstraints()
    }
}
