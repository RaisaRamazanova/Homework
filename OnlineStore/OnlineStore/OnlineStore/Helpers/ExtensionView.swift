//
//  Extension.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 04.09.2021.
//

import UIKit

extension UIView {
    
    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    // тень для кнопки ихихихих :)
    func addShadow() {
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowOffset = CGSize(width: -1, height: 2)
    self.layer.shadowRadius = 1.8
    self.layer.shadowOpacity = 0.3
    }
}
