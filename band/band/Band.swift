//
//  Band.swift
//  band
//
//  Created by Isabel  Lee on 20/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

// http://stackoverflow.com/questions/26815263/setting-a-rotation-point-for-cgaffinetransformmakerotation-swift

import UIKit

class Band: UIView {
    init(){
        super.init(frame: CGRect(x: 150.0 , y: 200.0, width: 800.0, height: 600.0))
        //self.backgroundColor = UIColor.red
        addSaxphoneBunny()
        addDrumBunny()
        addTromboneBunny()
        addSpotlight()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addTromboneBunny() {
        let tromboneBunny = UIImageView(frame: CGRect(x: 0.0 , y: 180.0, width: 350.0, height: 400.0))
        tromboneBunny.image = UIImage(named: "t_bunny")
        tromboneBunny.contentMode = .scaleAspectFit
        wiggleAnimation(image: tromboneBunny)
        
        self.addSubview(tromboneBunny)
    }
    
    func addDrumBunny() {
        let drumBunny = UIImageView(frame: CGRect(x: 250.0 , y: 160.0, width: 350.0, height: 400.0))
        drumBunny.image = UIImage(named: "d_bunny")
        drumBunny.contentMode = .scaleAspectFit
        wiggleAnimation(image: drumBunny)
        self.addSubview(drumBunny)
    }
    
    func addSaxphoneBunny() {
        let saxphoneBunny = UIImageView(frame: CGRect(x: 500.0 , y: 180.0, width: 350.0, height: 400.0))
        saxphoneBunny.image = UIImage(named: "s_bunny")
        saxphoneBunny.contentMode = .scaleAspectFit
        wiggleAnimation(image: saxphoneBunny)
        self.addSubview(saxphoneBunny)
    }
    
    func wiggleAnimation(image: UIImageView) {
        let angle = 0.1
        let wiggle = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        wiggle.values = [-angle, angle]
        
        wiggle.autoreverses = true
        wiggle.duration = self.randomInterval(0.5, variance: 0.025)
        wiggle.repeatCount = Float.infinity
        wiggle.isAdditive = true
        image.layer.add(wiggle, forKey: "wiggle")
    }
    
    func addSpotlight() {
        
        // Add left spot light
        let leftlight = UIImageView(frame: CGRect(x: 0.0 , y: 0.0, width: 400.0, height: 600.0))
        leftlight.image = UIImage(named: "light_l")
        leftlight.alpha = 0.6
        self.addSubview(leftlight)
        rotateWithAnchor(image: leftlight, anchorX: 0.0, anchorY: 0.0, fromAngle: 0.0, toAngle: -20.0)

        
        // Add right spotlight
        let rightlight = UIImageView(frame: CGRect(x: 400.0 , y: 0.0, width: 400.0, height: 600.0))
        rightlight.image = UIImage(named: "light_r")
        rightlight.alpha = 0.6
        self.addSubview(rightlight)
        rotateWithAnchor(image: rightlight, anchorX: 1.0, anchorY: 0.0, fromAngle: 0.0, toAngle: 20.0)
    }
    
    func rotateWithAnchor(image: UIView, anchorX: Double, anchorY: Double, fromAngle: Double, toAngle: Double){
        setAnchorPoint(anchorPoint: CGPoint(x: anchorX, y: anchorY), view: image)
        if #available(iOS 10.0, *) {
            let rotationInDegrees = Measurement(value: 45, unit: UnitAngle.degrees)
            let rotationInRadians = CGFloat(rotationInDegrees.converted(to: .radians).value)
            let transform = CATransform3DMakeRotation(rotationInRadians, 0, 0.0, 1.0)
            image.layer.transform = transform
            
            let animation = CABasicAnimation(keyPath: "transform")
            animation.fromValue = NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(Measurement(value: fromAngle, unit: UnitAngle.degrees).converted(to: .radians).value), 0, 0.0, 1.0))
            animation.toValue = NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(Measurement(value: toAngle, unit: UnitAngle.degrees).converted(to: .radians).value), 0, 0.0, 1.0))
            animation.duration = 2.0
            animation.repeatCount = Float.infinity
            animation.autoreverses = true
            image.layer.add(animation, forKey: "rotateWithAnchor")
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    func setAnchorPoint(anchorPoint: CGPoint, view: UIView) {
        var newPoint = CGPoint(x: view.bounds.size.width * anchorPoint.x, y: view.bounds.size.height * anchorPoint.y)
        var oldPoint = CGPoint(x: view.bounds.size.width * view.layer.anchorPoint.x, y: view.bounds.size.height * view.layer.anchorPoint.y)
        
        newPoint = newPoint.applying(view.transform)
        oldPoint = oldPoint.applying(view.transform)
        
        var position : CGPoint = view.layer.position
        
        position.x -= oldPoint.x
        position.x += newPoint.x;
        position.y -= oldPoint.y;
        position.y += newPoint.y;
        
        view.layer.position = position;
        view.layer.anchorPoint = anchorPoint;
    }
    
    func randomInterval(_ interval: TimeInterval, variance: Double) -> TimeInterval {
        return interval + variance * Double((Double(arc4random_uniform(1000)) - 500.0) / 500.0)
    }
}
