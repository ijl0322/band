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
    
    var tromboneBunny: UIImageView!
    var drumBunny: UIImageView!
    var saxphoneBunny: UIImageView!
    var leftLight: UIImageView!
    var rightLight: UIImageView!
    
    init(){
        super.init(frame: CGRect(x: 150.0 , y: 200.0, width: 800.0, height: 600.0))
        //self.backgroundColor = UIColor.red
        addBunnies()
        addSpotlight()
        addButtons()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addButtons() {
        let playButton: UIButton = UIButton(frame: CGRect(x: 0.0 , y: 0.0, width: 120.0, height: 50.0))
        playButton.backgroundColor = UIColor.white
        playButton.setTitle("Play", for: UIControlState.normal)
        playButton.addTarget(self, action: #selector(playButton(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(playButton)
        
        let clearButton: UIButton = UIButton(frame: CGRect(x: 0, y: 50.0, width: 120.0, height: 50.0))
        clearButton.backgroundColor = UIColor.red
        playButton.setTitle("Stop", for: UIControlState.normal)
        clearButton.addTarget(self, action: #selector(stopButton(_:)), for: UIControlEvents.touchUpInside)
        self.addSubview(clearButton)
        
    }
    
    func playButton(_ button: UIButton!) {
        startBand()
    }
    
    
    func stopButton(_ button: UIButton!) {
        stopAllAnimation()
    }
    
    func startBand() {
        leftLight.alpha = 0.7
        rightLight.alpha = 0.7
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6){
            self.animateBunnies()
            self.animateSpotlight()
        }
    }
    
    func addBunnies() {
        tromboneBunny = UIImageView(frame: CGRect(x: 0.0 , y: 180.0, width: 350.0, height: 400.0))
        tromboneBunny.image = UIImage(named: "t_bunny")
        tromboneBunny.contentMode = .scaleAspectFit
        self.addSubview(tromboneBunny)
        
        drumBunny = UIImageView(frame: CGRect(x: 250.0 , y: 160.0, width: 350.0, height: 400.0))
        drumBunny.image = UIImage(named: "d_bunny")
        drumBunny.contentMode = .scaleAspectFit
        self.addSubview(drumBunny)
        
        saxphoneBunny = UIImageView(frame: CGRect(x: 500.0 , y: 180.0, width: 350.0, height: 400.0))
        saxphoneBunny.image = UIImage(named: "s_bunny")
        saxphoneBunny.contentMode = .scaleAspectFit
        self.addSubview(saxphoneBunny)
    }
    
    func animateBunnies() {
        wiggleAnimation(image: tromboneBunny)
        wiggleAnimation(image: drumBunny)
        wiggleAnimation(image: saxphoneBunny)
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
        leftLight = UIImageView(frame: CGRect(x: 0.0 , y: 0.0, width: 400.0, height: 600.0))
        leftLight.image = UIImage(named: "light_l")
        leftLight.alpha = 0
        self.addSubview(leftLight)
        
        // Add right spotlight
        rightLight = UIImageView(frame: CGRect(x: 400.0 , y: 0.0, width: 400.0, height: 600.0))
        rightLight.image = UIImage(named: "light_r")
        rightLight.alpha = 0
        self.addSubview(rightLight)
    }
    
    func animateSpotlight() {
        leftLight.alpha = 0.7
        rightLight.alpha = 0.7
        rotateWithAnchor(image: leftLight, anchorX: 0.0, anchorY: 0.0, fromAngle: 0.0, toAngle: -20.0)
        rotateWithAnchor(image: rightLight, anchorX: 1.0, anchorY: 0.0, fromAngle: 0.0, toAngle: 20.0)
    }
    
    func stopAllAnimation(){
        leftLight.alpha = 0
        rightLight.alpha = 0
        leftLight.transform = CGAffineTransform(rotationAngle: (0.0 * CGFloat(M_PI)) / 180.0)
        rightLight.transform = CGAffineTransform(rotationAngle: (0.0 * CGFloat(M_PI)) / 180.0)
        drumBunny.layer.removeAllAnimations()
        saxphoneBunny.layer.removeAllAnimations()
        tromboneBunny.layer.removeAllAnimations()
        leftLight.layer.removeAllAnimations()
        rightLight.layer.removeAllAnimations()
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