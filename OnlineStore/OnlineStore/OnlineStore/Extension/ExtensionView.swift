//
//  Extension.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 04.09.2021.
//

import UIKit

// MARK: - Extension UIView

extension UIView {
    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    func addShadow() {
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowOffset = CGSize(width: -1, height: 2)
    self.layer.shadowRadius = 1.8
    self.layer.shadowOpacity = 0.3
    }

    func animateDownView(_ viewAnimate: UIView) {
        UIView.animate(withDuration: 0) {
            viewAnimate.backgroundColor = UIColor(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
        }
    }

    func animateUpView(_ viewAnimate: UIView) {
        UIView.animate(withDuration: 0.5) {
            viewAnimate.backgroundColor = UIColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        }
    }
}
