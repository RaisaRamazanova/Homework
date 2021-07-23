//
//  RootVC.swift
//  HitTest
//
//  Created by Рамазанова Раисат on 23.07.2021.
//

import UIKit

final class RootVC: UIViewController {
    private lazy var red: UIView = {
        let circle = CircleView(frame: .init(x: 150, y: 125, width: 150, height: 150))
        circle.makeClearHole(rect: CGPoint(x: circle.bounds.size.width / 2, y: circle.bounds.size.height / 2), radius: Double(circle.bounds.size.height) / 4)
        circle.backgroundColor = .red
        circle.text = "RED"
        return circle
    }()
    
    private lazy var blue: UIView = {
        let circle = CircleView(frame: .init(x: 150, y: 125, width: 200, height: 200))
        circle.backgroundColor = .blue
        circle.text = "BLUE"
        return circle
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(blue)
        view.addSubview(red)
    }
}

extension UIView {
    func makeClearHole(rect: CGPoint, radius: Double) {
        let maskLayer = CAShapeLayer()
        maskLayer.fillRule = CAShapeLayerFillRule.evenOdd
        maskLayer.fillColor = UIColor.black.cgColor
        
        let pathToOverlay = UIBezierPath(rect: self.bounds)
        pathToOverlay.append(UIBezierPath.init(arcCenter: rect, radius: CGFloat(radius), startAngle: 0.0, endAngle: 2 * .pi, clockwise: true))
        pathToOverlay.usesEvenOddFillRule = true
        maskLayer.path = pathToOverlay.cgPath
        layer.mask = maskLayer
    }
}

