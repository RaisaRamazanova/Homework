//
//  CustomTabBar.swift
//  OnlineStore
//
//  Created by Рамазанова Раисат on 02.08.2021.
//

import UIKit

//final class CustomTabBar: UITabBar {
//    // MARK: - Properties
//    
//    private var tabBarWidth: CGFloat { self.bounds.width }
//    private var tabBarHeight: CGFloat { self.bounds.height }
//    private var centerWidth: CGFloat { self.bounds.width / 2 }
//    private let circleRadius: CGFloat = 27
//    
//    private var shapeLayer: CALayer? = nil
//    private var circleLayer: CALayer? = nil
//    
//    // MARK: - Overriden Methods
//    
//    override func draw(_ rect: CGRect) {
//        drawTabBar()
//        print("draw")
//    }
//    
//    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//        print("point")
//        let pointIsInside = super.point(inside: point, with: event) 
//        if pointIsInside == false {
//            for subview in subviews {
//                let pointInSubview = subview.convert(point, from: self)
//                if subview.point(inside: pointInSubview, with: event) {
//                    return true
//                }
//            }
//        }
//        return pointIsInside
//    }
//    
//    // MARK: - Private Methods
//    
//    private func drawTabBar() {
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = shapePath()
//        shapeLayer.strokeColor = UIColor.lightGray.cgColor
//        shapeLayer.fillColor = UIColor.white.cgColor
//        shapeLayer.lineWidth = 1.0
//
//        let circleLayer = CAShapeLayer()
//        circleLayer.path = circlePath()
//        circleLayer.strokeColor = UIColor.lightGray.cgColor
//        circleLayer.fillColor = UIColor.white.cgColor
//        circleLayer.lineWidth = 1.0
//
//        if let oldShapeLayer = self.shapeLayer {
//            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
//        } else {
//            self.layer.insertSublayer(shapeLayer, at: 0)
//        }
//        
//        if let oldCircleLayer = self.circleLayer {
//            self.layer.replaceSublayer(oldCircleLayer, with: circleLayer)
//        } else {
//            self.layer.insertSublayer(circleLayer, at: 1)
//        }
//
//        self.shapeLayer = shapeLayer
//        self.circleLayer = circleLayer
//    }
//    
//    private func shapePath() -> CGPath {
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: 0, y: 0))
//        path.addLine(to: CGPoint(x: tabBarWidth, y: 0))
//        path.addLine(to: CGPoint(x: tabBarWidth, y: tabBarHeight))
//        path.addLine(to: CGPoint(x: 0, y: tabBarHeight))
//        path.close()
//        return path.cgPath
//    }
//    
//    private func circlePath() -> CGPath {
//        let path = UIBezierPath()
//        path.addArc(withCenter: CGPoint(x: centerWidth, y: 12),
//                    radius: circleRadius,
//                    startAngle: 180 * .pi / 180,
//                    endAngle: 0 * 180 / .pi,
//                    clockwise: true)
//        return path.cgPath
//    }
//}
