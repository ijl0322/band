//
//  LightingView.swift
//  band
//
//  Created by Isabel  Lee on 21/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit
//import QuartzCore

class LightingView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        let emitter = layer as! CAEmitterLayer
//        emitter.emitterPosition = CGPoint(x: bounds.size.width / 2, y: 0)
//        emitter.emitterSize = bounds.size
//        emitter.emitterShape = kCAEmitterLayerRectangle
//        
//        let emitterCell = CAEmitterCell()
//        emitterCell.contents = UIImage(named: "Sparkle.png")!.cgImage
//        emitterCell.birthRate = 200
//        emitterCell.lifetime = 3.5
//        emitterCell.color = UIColor.white.cgColor
//        emitterCell.redRange = 0.0
//        emitterCell.blueRange = 0.1
//        emitterCell.greenRange = 0.0
//        emitterCell.velocity = 10
//        emitterCell.velocityRange = 350
//        emitterCell.emissionRange = CGFloat(M_PI_2)
//        emitterCell.emissionLongitude = CGFloat(-M_PI)
//        emitterCell.yAcceleration = 70
//        emitterCell.xAcceleration = 0
//        emitterCell.scale = 0.33
//        emitterCell.scaleRange = 1.25
//        emitterCell.scaleSpeed = -0.25
//        emitterCell.alphaRange = 0.5
//        emitterCell.alphaSpeed = -0.15
//        
//        emitter.emitterCells = [emitterCell]
        let emitter = layer as! CAEmitterLayer
        emitter.emitterPosition = CGPoint(x: bounds.size.width / 2, y: 0)
        emitter.emitterSize = bounds.size
        emitter.emitterShape = kCAEmitterLayerRectangle
        
        let cell = CAEmitterCell()
        cell.contents = UIImage(named: "Sparkle.png")!.cgImage
        cell.birthRate = 10
        cell.speed = 2.0
        cell.lifetime = 10
        
        emitter.emitterCells = [cell]
        emitter.emitterPosition = CGPoint(x: 200, y: 400)
        emitter.emitterShape = kCAEmitterLayerSphere
        emitter.emitterSize = CGSize(width: 800, height: 800)
        emitter.renderMode = kCAEmitterLayerOldestFirst
        
        cell.velocity = 5.0
        cell.velocityRange = 700
        cell.yAcceleration = 10
        cell.xAcceleration = 0
        cell.scale = 1.0
        cell.scaleRange = 1.0
        cell.scaleSpeed = 0.5
        cell.lifetimeRange = 10
        cell.spin = 1.0
        cell.spinRange = 10.0
        cell.alphaSpeed = -0.1

    
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class var layerClass: AnyClass {
        return CAEmitterLayer.self
    }
}
