//
//  LoginViewController.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 07.09.2021.
//

import UIKit

final class LoginViewController: UIViewController {

    // MARK: - Properties

    private let mainView = LoginView()

    // MARK: - init

    init(userLogin: String) {
        super.init(nibName: nil, bundle: nil)
        let defaults = UserDefaults.standard
        let name = defaults.object(forKey: userLogin) as? String ?? "Name"
        mainView.registerLabel.text = "Привет, \(name)"
        mainView.shinyRegisterLabel.text = "Привет, \(name)"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - life cycle

    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        setActions()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        titleAnimation()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        mainView.shinyRegisterLabel.layer.removeAllAnimations()
    }

    // MARK: - function

    private func setActions() {
        mainView.actionOnButtonTap1 = {
            self.touchUpInsideButton()
        }
        mainView.actionOnButtonTap2 = {
            self.touchDownButton()
        }
    }

    fileprivate func touchUpInsideButton() {
        view.animateUpView(self.mainView.unloginButton)
    }

    fileprivate func touchDownButton() {
        view.animateDownView(self.mainView.unloginButton)
        UserDefaults.standard.set(false, forKey: "isUserLogin")
        self.navigationController?.popViewController(animated: true)
    }

    private func titleAnimation() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 200, height: 200)

        let angle = 45 * CGFloat.pi / 180
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        mainView.shinyRegisterLabel.layer.mask = gradientLayer

        // анимация
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 2
        animation.fromValue = -view.frame.width
        animation.toValue = view.frame.width
        animation.repeatCount = Float.infinity
        gradientLayer.add(animation, forKey: "key")
    }
}
