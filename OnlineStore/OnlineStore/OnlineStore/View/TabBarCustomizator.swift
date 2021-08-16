//
//  CustomTabBar.swift
//  OnlineStore
//
//  Created by Рамазанова Раисат on 02.08.2021.
//

import UIKit

class TabBarCustomizator {
    
    // MARK: - Properties
    var tabBar: UITabBar!
    private let bumpHeight: CGFloat = 16
    private let shapeLayer = CAShapeLayer()
    private let lightColor: UIColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0)
    private let button = UIView()
    private let buttonRadius: CGFloat = 29
    private let imgButtonIcon = UIImageView(image: UIImage(systemName: "book", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .medium)))
    var isButtonMovedUp = false
    
    // MARK: - Methods
    func customize() {
        addShape()
        createButton()
    }
    
    private func addShape() {
        shapeLayer.path = createPath()
        shapeLayer.fillColor = lightColor.cgColor
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowRadius = 3
        shapeLayer.shadowOffset = CGSize(width: 0, height: 3)
        shapeLayer.shadowOpacity = 1
        
        tabBar.layer.insertSublayer(shapeLayer, at: 0)
    }
    
    private func createPath() -> CGPath {
        let path = UIBezierPath()
        let centerWidth = tabBar.frame.midX
        let topYInset: CGFloat = 8
        let buttonXInset: CGFloat = 12
        let kCurveCorrection: CGFloat = 5
        
        // Start from top left corner
        path.move(to: CGPoint(x: 0, y: -topYInset))
        path.addLine(to: CGPoint(x: (centerWidth - (buttonRadius + bumpHeight + buttonXInset)), y: -topYInset))
        
        // Begin of bump
        path.addCurve(to: CGPoint(x: centerWidth, y: -bumpHeight - topYInset), controlPoint1: CGPoint(x: centerWidth - buttonRadius - kCurveCorrection, y: -topYInset), controlPoint2: CGPoint(x: (centerWidth - buttonRadius + kCurveCorrection), y: -bumpHeight - topYInset))
        // End of bump
        path.addCurve(to: CGPoint(x: centerWidth + (buttonRadius + bumpHeight + buttonXInset), y: -topYInset), controlPoint1: CGPoint(x: (centerWidth + buttonRadius - kCurveCorrection), y: -bumpHeight - topYInset), controlPoint2: CGPoint(x: centerWidth + buttonRadius + kCurveCorrection, y: -topYInset))
        
        path.addLine(to: CGPoint(x: tabBar.frame.width, y: -topYInset))
        path.addLine(to: CGPoint(x: tabBar.frame.width, y: tabBar.frame.height * 2))
        path.addLine(to: CGPoint(x: 0, y: tabBar.frame.height * 2))
        path.close()
        
        return path.cgPath
    }
    
    private func createButton() {
        let tabBarHeight = UIScreen.main.bounds.size.height - tabBar.frame.minY
        imgButtonIcon.center = CGPoint(x: tabBar.frame.midX, y: (tabBarHeight - bumpHeight) / 2.0)
        
        let circle = CAShapeLayer()
        circle.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 2 * buttonRadius, height: 2 * buttonRadius), cornerRadius: buttonRadius).cgPath
        circle.fillColor = UIColor.systemGray.cgColor
        circle.position = CGPoint(x: imgButtonIcon.center.x - buttonRadius, y: imgButtonIcon.center.y - buttonRadius)
        circle.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        circle.shadowRadius = 5
        circle.shadowOffset = .zero
        circle.shadowOpacity = 1
        
        button.tintColor = .white
        button.layer.addSublayer(circle)
        button.addSubview(imgButtonIcon)
        tabBar.addSubview(button)
    }
    
    private func changeButtonIcon() {
        if isButtonMovedUp {
            button.tintColor = .systemYellow
        } else {
            button.tintColor = .white
        }
    }
    
    func moveButton() {
            UIView.animate(withDuration: 0.5,
                           delay: 0.0,
                           options: [],
                           animations: { [weak self] in
                            guard let self = self else { return }
                            if self.isButtonMovedUp {
                                self.button.center.y += self.buttonRadius * 0.2
                                self.isButtonMovedUp.toggle()
                            } else {
                                self.button.center.y -= self.buttonRadius * 0.2
                                self.isButtonMovedUp.toggle()
                            }
                            self.button.tintColor = self.isButtonMovedUp ? .white : .systemYellow },
                                                   completion: { _ in
                                                    self.changeButtonIcon() }
            )
        }
    
    
}
