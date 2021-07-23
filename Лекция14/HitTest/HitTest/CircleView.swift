//
//  CircleView.swift
//  HitTest
//
//  Created by Рамазанова Раисат on 23.07.2021.
//

import UIKit

final class CircleView: UIView {

    var touchAreaPadding: UIEdgeInsets?

    override func point(inside point: CGPoint,with event: UIEvent?) -> Bool {
        guard let insets = touchAreaPadding else {
            return super.point(inside: point, with: event)
        }
        let rect = bounds.inset(by: insets.inverted())
        return rect.contains(point)
    }
    
    var text: String? {
        didSet {
            label.text = text
        }
    }

    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
//        addSubview(label)
        layer.cornerRadius = frame.height / 2
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 0, y: bounds.height / 2 - 15, width: bounds.width, height: 30)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        
        print(view?.next as Any)

        return view
    }
}

//class ButtonWithTouchSize: UIView {
//    var touchAreaPadding: UIEdgeInsets?
//
//    override func point(inside point: CGPoint,with event: UIEvent?) -> Bool {
//        guard let insets = touchAreaPadding else {
//            return super.point(inside: point, with: event)
//        }
//        let rect = bounds.inset(by: insets.inverted())
//        return rect.contains(point)
//    }
//}
extension UIEdgeInsets {
    func inverted() -> UIEdgeInsets {
        return UIEdgeInsets(top: -top, left: -left,
                            bottom: -bottom, right: -right)
    }
}
