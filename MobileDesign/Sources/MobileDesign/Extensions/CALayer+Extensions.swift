//
//  CALayer+Extensions.swift
//  PlatformUI
//
//  Created by Smitesh Patel on 2021-01-27.
//  Copyright © 2021 Rogers Communication Inc. All rights reserved.
//

import Foundation

extension UIBezierPath {

    convenience init(lineSegment: LineSegment) {
        self.init()
        self.move(to: lineSegment.startPoint)
        self.addLine(to: lineSegment.endPoint)
    }
}

extension CALayer {
    
    func addLineLayer(lineSegment: LineSegment, color: CGColor, width: CGFloat, isDashed: Bool, animated: Bool, oldSegment: LineSegment?) {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(lineSegment: lineSegment).cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = color
        layer.lineWidth = width
        if isDashed {
            layer.lineDashPattern = [4, 4]
        }
        addSublayer(layer)
        
        if animated, let segment = oldSegment {
            layer.animate(
                fromValue: UIBezierPath(lineSegment: segment).cgPath,
                toValue: layer.path!,
                keyPath: "path")
        }
    }
    
    func addTextLayer(frame: CGRect, color: CGColor, fontSize: CGFloat, text: String, animated: Bool, oldFrame: CGRect?) {
        let textLayer = CATextLayer()
        textLayer.frame = frame
        textLayer.foregroundColor = color
        textLayer.backgroundColor = UIColor.clear.cgColor
        textLayer.alignmentMode = .center
        textLayer.contentsScale = UIScreen.main.scale
        textLayer.font = CTFontCreateWithName(UIFont.systemFont(ofSize: 0).fontName as CFString, 0, nil)
        textLayer.fontSize = fontSize
        textLayer.string = text
        addSublayer(textLayer)
        
        if animated, let oldFrame = oldFrame {
            // "frame" property is not animatable in CALayer, so, I use "position" instead
            // Position is at the center of the frame (if you don't change the anchor point)
            let oldPosition = CGPoint(x: oldFrame.midX, y: oldFrame.midY)
            textLayer.animate(fromValue: oldPosition, toValue: textLayer.position, keyPath: "position")
        }
    }
    
    func addCircleLayer(origin: CGPoint, radius: CGFloat, color: CGColor, animated: Bool, oldOrigin: CGPoint?) {
        let layer = CALayer()
        layer.frame = CGRect(x: origin.x, y: origin.y, width: radius * 2, height: radius * 2)
        layer.backgroundColor = color
        layer.cornerRadius = radius
        addSublayer(layer)
        
        if animated, let oldOrigin = oldOrigin {
            let oldFrame = CGRect(x: oldOrigin.x, y: oldOrigin.y, width: radius * 2, height: radius * 2)
            
            // "frame" property is not animatable in CALayer, so, I use "position" instead
            layer.animate(fromValue: CGPoint(x: oldFrame.midX, y: oldFrame.midY),
                          toValue: CGPoint(x: layer.frame.midX, y: layer.frame.midY),
                          keyPath: "position")
        }
    }
    
    func addRectangleLayer(frame: CGRect, color:CGColor, animated: Bool, oldFrame: CGRect?) {
        let layer = CALayer()
        layer.frame = frame
        layer.backgroundColor = color
        layer.cornerRadius = frame.width/2
        addSublayer(layer)
        if animated, let oldFrame = oldFrame {
            layer.animate(fromValue: CGPoint(x: oldFrame.midX, y: oldFrame.midY), toValue: layer.position, keyPath: "position")
            layer.animate(fromValue: CGRect(x: 0, y: 0, width: oldFrame.width, height: oldFrame.height), toValue: layer.bounds, keyPath: "bounds")
        }
    }
    
    func addGradientLayer(frame: CGRect, colors:[UIColor], locations:[NSNumber], animated: Bool, oldFrame: CGRect?) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.locations = locations
        gradientLayer.cornerRadius = frame.width/2
        addSublayer(gradientLayer)
        if animated, let oldFrame = oldFrame {
            gradientLayer.animate(fromValue: CGPoint(x: oldFrame.midX, y: oldFrame.midY), toValue: gradientLayer.position, keyPath: "position")
            gradientLayer.animate(fromValue: CGRect(x: 0, y: 0, width: oldFrame.width, height: oldFrame.height), toValue: gradientLayer.bounds, keyPath: "bounds")
        }
    }
    
    func animate(fromValue: Any, toValue: Any, keyPath: String) {
        let anim = CABasicAnimation(keyPath: keyPath)
        anim.fromValue = fromValue
        anim.toValue = toValue
        anim.duration = 0.5
        anim.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        add(anim, forKey: keyPath)
    }
}
