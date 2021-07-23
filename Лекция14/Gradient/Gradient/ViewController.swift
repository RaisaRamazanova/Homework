//
//  ViewController.swift
//  Gradient
//
//  Created by Дмитрий Рудановский on 16.07.2021.
//

import UIKit

class ViewController: UIViewController {

    let colors = Colors()

    let button = UIButton()
    
    
    func refresh() {
        view.backgroundColor = UIColor.clear
        let backgroundLayer = colors.gl
        backgroundLayer!.frame = view.frame
        view.layer.insertSublayer(backgroundLayer!, at: 0)
        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.button.refreshButton()
        self.button.setTitleColor(.black, for: .normal)
        self.button.titleLabel?.font =  UIFont(name:"Marker Felt", size: 20.0)
        self.button.setTitle("Gradient", for: .normal)
        self.view.addSubview(button)
        self.refresh()
        
        
    }
}

// MARK: - UIButton

extension UIButton {
    func refreshButton() {
        let colors = Colors()
        self.backgroundColor = UIColor.clear
        let backgroundLayer = colors.gl
        backgroundLayer!.frame = self.frame
        self.layer.insertSublayer(backgroundLayer!, at: 0)
    }
}

class Colors {
    var gl:CAGradientLayer!

    init() {
        let colorTop = UIColor(red: 192.0 / 255.0, green: 38.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 35.0 / 255.0, green: 2.0 / 255.0, blue: 2.0 / 255.0, alpha: 1.0).cgColor

        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 1.0]
    }
}

