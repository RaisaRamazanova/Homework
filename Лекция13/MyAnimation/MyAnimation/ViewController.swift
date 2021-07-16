//
//  ViewController.swift
//  MyAnimation
//
//  Created by Рамазанова Раисат on 16.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let startButton = UIButton(frame: CGRect(x: 100, y: 200, width: 200, height: 50))
    let imagePigView = UIImageView(image: UIImage(named: "pigLeft"))
    let apple = UIImageView(image: UIImage(named: "apple"))
    let basketOfApple = UIImageView(image: UIImage(named: "basketOfApple"))
    let endLabel = UILabel(frame: CGRect(x: 50, y: 200, width: 400, height: 30))
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        
        self.startButton.backgroundColor = .systemBlue
        self.startButton.setTitleColor(.black, for: .normal)
        self.startButton.titleLabel?.font =  UIFont(name:"Marker Felt", size: 20.0)
        self.startButton.setTitle("Покормить свинку", for: .normal)
        self.startButton.addTarget(self, action: #selector(preStart), for: .touchUpInside)
        basketOfApple.frame = CGRect(x: 50, y: 500, width: 100, height: 100)
        apple.frame = CGRect(x: 50, y: 500, width: 30, height: 30)
        imagePigView.frame = CGRect(x: 100, y: 300, width: 100, height: 100)
        
        self.imagePigView.center = view.center
        
        self.view.addSubview(apple)
        self.view.addSubview(basketOfApple)
        self.view.addSubview(imagePigView)
        self.view.addSubview(startButton)
        self.view.addSubview(startButton)

    }
    
    
    @objc func preStart() {
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseOut, animations: {self.startButton.alpha = 0.0})
        Timer.scheduledTimer(timeInterval: TimeInterval(1.5), target: self, selector: #selector(giveApple), userInfo: nil, repeats: false)
    }
    
    @objc func giveApple(imageFlyView: UIImageView) {
        let animationApple = CAKeyframeAnimation(keyPath: "position")
        let pathArray = [[100, 500], [200, 400]]
        animationApple.values = pathArray
        animationApple.duration = 3.0
        apple.layer.add(animationApple, forKey: "flyApple")
        CATransaction.commit()
        
        Timer.scheduledTimer(timeInterval: TimeInterval(3), target: self, selector: #selector(duner), userInfo: nil, repeats: false)
    }
        
    @objc func duner(imageFlyView: UIImageView) {

        let animationZoomPig = CABasicAnimation(keyPath: "transform.scale")
        animationZoomPig.fromValue = 1
        animationZoomPig.toValue = 2
        animationZoomPig.duration = 4.0
        animationZoomPig.autoreverses = true
        animationZoomPig.repeatCount = 1
        animationZoomPig.isRemovedOnCompletion = false
        imagePigView.layer.add(animationZoomPig, forKey: "pigZoom")
        Timer.scheduledTimer(timeInterval: TimeInterval(4), target: self, selector: #selector(end), userInfo: nil, repeats: false)
    }
    
    @objc func end() {

        self.endLabel.textColor = .black
        self.endLabel.text = "Ой, она так быстро проголодалась снова"
        self.endLabel.font = UIFont(name:"Marker Felt", size: 16.0)
        self.endLabel.alpha = 0
        self.view.addSubview(self.endLabel)

        let animationBubbleOpacity = CABasicAnimation(keyPath: "opacity")
        animationBubbleOpacity.fromValue = 0.0
        animationBubbleOpacity.toValue = 1.0
        animationBubbleOpacity.duration = 2
        animationBubbleOpacity.autoreverses = true
        animationBubbleOpacity.repeatCount = 1
        self.endLabel.layer.add(animationBubbleOpacity, forKey: "animationBubbleOpacity")

    }
}




