//
//  SplashView.swift
//  TwitterSplashScreenAnimation
//
//  Created by Karthick Ramasamy on 2/10/19.
//  Copyright © 2019 Karthick Ramasamy. All rights reserved.
//

import UIKit

class SplashView: UIView {
    var bezierPath: UIBezierPath
    var layerColor: UIColor
    private var animationLayer: CAShapeLayer!
    
    init(bezierPath: UIBezierPath, backgroundColor: UIColor) {
        self.bezierPath = bezierPath
        self.layerColor = backgroundColor
        super.init(frame: UIScreen.main.bounds)
        animationLayer = createShapeLayer(with: bezierPath)
        self.layer.addSublayer(animationLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createShapeLayer(with bezierPath: UIBezierPath) -> CAShapeLayer {
        let shapeBounds = self.bounds.insetBy(dx: -self.bounds.size.width, dy: -self.bounds.size.height)
        let mutablePath = CGMutablePath()
        mutablePath.addRect(shapeBounds)
        
        // move the icon to the middle.
        let iconX = bounds.size.width/2 - bezierPath.bounds.width/2
        let iconY = bounds.size.height/2 - bezierPath.bounds.height/2
        let iconTransform = CGAffineTransform(translationX: iconX, y: iconY)
        mutablePath.addPath(bezierPath.cgPath, transform: iconTransform)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.bounds = shapeBounds
        shapeLayer.path = mutablePath
        shapeLayer.position = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        shapeLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        shapeLayer.fillColor = layerColor.cgColor
        
        return shapeLayer
    }
    
    func startAnimation() {
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.values = [1, 0.9, 300]
        animation.keyTimes = [0, 0.4, 1]
        animation.duration = 1.4
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animationLayer.add(animation, forKey: "transform")
    }
}
