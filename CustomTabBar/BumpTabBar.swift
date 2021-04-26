//
//  BumpTabBar.swift
//  BumpTabBar
//
//  Created by Anton Ivanou on 25.04.21.
//

import UIKit

@IBDesignable
class BumpTabBar: UITabBar {

    private var shapeLayer: CALayer?
    
    private let bumpHeight: CGFloat = 20
    private let mainButtonRadius: CGFloat = 32
    private let barColor: UIColor = UIColor(red: 42/255, green: 54/255, blue: 72/255, alpha: 1.0)
    
    var mainButtonHandler: (() -> Void)?

    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.fillColor = barColor.cgColor
        shapeLayer.shadowRadius = 3
        shapeLayer.shadowOffset = CGSize(width: 0, height: 3)
        shapeLayer.shadowOpacity = 1

        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }

        self.shapeLayer = shapeLayer
    }
    
    override func draw(_ rect: CGRect) {
        self.addShape()
        createRedButton()
    }
    
    private func createPath() -> CGPath {
        let path = UIBezierPath(ovalIn: frame)
        let centerWidth = frame.midX
        let topYInset: CGFloat = 8
        let buttonXInset: CGFloat = 12
        let kCurveCorrection: CGFloat = 5
        
        // Start from top left corner
        path.move(to: CGPoint(x: 0, y: -topYInset))
        path.addLine(to: CGPoint(x: (centerWidth - (mainButtonRadius + bumpHeight + buttonXInset)), y: -topYInset))
        
        // Begin of bump
        path.addCurve(to: CGPoint(x: centerWidth, y: -bumpHeight - topYInset),
                      controlPoint1: CGPoint(x: centerWidth - mainButtonRadius - kCurveCorrection, y: -topYInset),
                      controlPoint2: CGPoint(x: (centerWidth - mainButtonRadius + kCurveCorrection), y: -bumpHeight - topYInset))
        // End of bump
        path.addCurve(to: CGPoint(x: centerWidth + (mainButtonRadius + bumpHeight + buttonXInset), y: -topYInset),
                      controlPoint1: CGPoint(x: (centerWidth + mainButtonRadius - kCurveCorrection), y: -bumpHeight - topYInset),
                      controlPoint2: CGPoint(x: centerWidth + mainButtonRadius + kCurveCorrection, y: -topYInset))
        
        path.addLine(to: CGPoint(x: frame.width, y: -topYInset))
        path.addLine(to: CGPoint(x: frame.width, y: frame.height * 2))
        path.addLine(to: CGPoint(x: 0, y: frame.height * 2))
        path.close()
        
        return path.cgPath
    }
    
    private func createRedButton() {
        let button = UIButton()
        
        button.frame =  CGRect(x: 0, y: 0, width: mainButtonRadius * 2, height: mainButtonRadius * 2)
        button.center = CGPoint(x: frame.midX, y: bumpHeight / 2.0 + 3)
        button.setImage(UIImage(named: "Round"), for: .normal)
        
        button.addTarget(self, action: #selector(mainAction), for: .touchUpInside)
        addSubview(button)
    }
    
    @objc private func mainAction() {
        (mainButtonHandler ?? {})()
    }
}
