//
//  ExtensionActivity.swift
//  OnlineStore
//
//  Created by Раисат Рамазанова on 05.09.2021.
//

import UIKit

// MARK: - Extension UIActivityIndicatorView

extension UIActivityIndicatorView {

    public func turnOn() {
        isHidden = false
        startAnimating()
    }

    public func turnOff() {
        isHidden = true
        stopAnimating()
    }
}
