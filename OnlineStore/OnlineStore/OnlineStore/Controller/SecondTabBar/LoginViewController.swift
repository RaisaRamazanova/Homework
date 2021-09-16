//
//  LoginViewController.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 07.09.2021.
//

import UIKit

final class LoginViewController: UIViewController {

    // MARK: - Properties

    private let registerLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 30))
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        label.text = "Привет"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .left
        return label
    }()

    private let shinyRegisterLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 30))
        label.textColor = .white
        label.text = "Привет"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .left
        return label
    }()

    private var unloginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 60, height: 40))
        button.backgroundColor = UIColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        button.setTitle("Выйти из профиля", for: .normal)
        button.tintColor = .black
        button.addShadow()
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(touchDownButton(sender:)), for: .touchDown)
        button.addTarget(self, action: #selector(touchUpInsideButton), for: .touchUpInside)
        return button
    }()

    private var imageOfPerson: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Профиль")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()

    // MARK: - init

    init(userLogin: String) {
        super.init(nibName: nil, bundle: nil)
        let defaults = UserDefaults.standard
        let name = defaults.object(forKey: userLogin) as? String ?? "Name"
        registerLabel.text = "Привет, \(name)"
        shinyRegisterLabel.text = "Привет, \(name)"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //  MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        self.view.backgroundColor = UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        titleAnimation()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        shinyRegisterLabel.layer.removeAllAnimations()
    }

    // MARK: - function

    @objc fileprivate func touchUpInsideButton(sender: UIButton) {
        view.animateUpView(sender)
    }

    private func titleAnimation() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 200, height: 200)

        let angle = 45 * CGFloat.pi / 180
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        shinyRegisterLabel.layer.mask = gradientLayer

        // анимация
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 2
        animation.fromValue = -view.frame.width
        animation.toValue = view.frame.width
        animation.repeatCount = Float.infinity

        gradientLayer.add(animation, forKey: "key")
    }

    @objc fileprivate func touchDownButton(sender: UIButton) {
        sender.animateDownView(sender)
        UserDefaults.standard.set(false, forKey: "isUserLogin")
        self.navigationController?.popViewController(animated: true)
    }

    // создаем constraint и добавляем Subview
    private func setupLayout() {
        [registerLabel,
         imageOfPerson,
         shinyRegisterLabel,
         unloginButton].forEach {
            view.addSubview($0)
            $0.toAutoLayout()
        }

        NSLayoutConstraint.activate([
            registerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            registerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            shinyRegisterLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            shinyRegisterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            imageOfPerson.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 20),
            imageOfPerson.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageOfPerson.heightAnchor.constraint(equalToConstant: 200),
            imageOfPerson.widthAnchor.constraint(equalToConstant: 200),

            unloginButton.topAnchor.constraint(equalTo: imageOfPerson.bottomAnchor, constant: 100),
            unloginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            unloginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            unloginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            unloginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
