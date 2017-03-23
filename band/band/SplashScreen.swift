//
//  SplashScreen.swift
//  band
//
//  Created by Isabel  Lee on 22/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class SplashScreen: UIView {
    var bandLogo: UIImageView!
    var signature: UIImageView!

    init() {
        super.init(frame: CGRect(x: 0.0 , y: 0.0, width: size.screenWidth.rawValue, height: size.screenHeight.rawValue))
        setUp()
    }
    
    func setUp() {
        self.backgroundColor = UIColor.black
        self.bandLogo = UIImageView(frame: CGRect(x: 172.0 , y: -128.0, width: 456, height: 128))
        self.bandLogo.image = UIImage(named: "bandLogo")
        self.signature = UIImageView(frame: CGRect(x: 84.0 , y: -118.0, width: 160, height: 118))
        self.signature.image = UIImage(named: "signature")
        self.addSubview(bandLogo)
        self.addSubview(signature)
    }
    
    func animateLogo() {
        UIView.animate(withDuration: 1, animations: {
            self.bandLogo.center.y = 273
        }, completion: {(finish: Bool) in
            UIView.animate(withDuration: 0.4, animations: {
              self.bandLogo.transform = CGAffineTransform(rotationAngle: (-15.0 * CGFloat(M_PI)) / 180.0)
            }, completion: { (finish: Bool) in UIView.animate(withDuration: 0.3, animations: {
                self.bandLogo.transform = CGAffineTransform(rotationAngle: (10.0 * CGFloat(M_PI)) / 180.0)
            }, completion: {(finish: Bool) in UIView.animate(withDuration: 0.2, animations: {
                self.bandLogo.transform = CGAffineTransform(rotationAngle: (0.0 * CGFloat(M_PI)) / 180.0)
            }, completion: {(finish: Bool) in UIView.animate(withDuration: 0.2, animations: {
                self.signature.center.y = 168
            }, completion: {(finish: Bool) in UIView.animate(withDuration: 1, delay: 2.0, animations: {
                self.bandLogo.center.y = 173
                self.signature.center.y = 68
            }, completion: nil)})})})})
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
