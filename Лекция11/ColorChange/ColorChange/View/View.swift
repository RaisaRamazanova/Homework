//
//  View.swift
//  ColorChange
//
//  Created by Рамазанова Раисат on 14.07.2021.
//

import UIKit

class ButtonView: UIView {
    
    weak var viewController: ViewController?
    
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    
    
    
    required init() {
        super.init(frame: .zero)
        
        button1.setButton(name: "RED", color: .red, x: 50, y: 100)
        button2.setButton(name: "BLUE", color: .blue, x: 50, y: 200)
        button3.setButton(name: "GRAY", color: .gray, x: 250, y: 100)
        button4.setButton(name: "GREEN", color: .green, x: 250, y: 200)
        
        self.addSubview(button1)
        self.addSubview(button2)
        self.addSubview(button3)
        self.addSubview(button4)
        
        button1.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button2.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button3.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button4.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton(button: UIButton) {
        self.viewController?.didTapButton(button: button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}



extension UIButton {
    func setButton(name: String, color: UIColor, x: Int, y: Int) {
        self.setTitle(name, for: .normal)
        self.backgroundColor = color
        self.setTitleColor(.white, for: .normal)
        self.frame = CGRect(x: x, y: y, width: 70, height: 50)
    }
}


