//
//  ViewController.swift
//  ColorChange
//
//  Created by Рамазанова Раисат on 14.07.2021.
//

import UIKit


class ViewController: UIViewController {
    
    var mainView = ButtonView()
    var modelButton = ModelButton()
    
    override func loadView() {
        super.loadView()
        view = mainView
        mainView.viewController = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backgroundColor = .white
    }
    
    @objc func didTapButton(button: UIButton) {
        mainView.backgroundColor = button.backgroundColor

    }

}


