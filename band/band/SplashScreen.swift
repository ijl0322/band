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
    var violinBunny: UIImageView!
    var saxphoneBunny: UIImageView!
    var tromboneBunny: UIImageView!
    var drumBunny: UIImageView!

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
        
        tromboneBunny = UIImageView(frame: CGRect(x: -250.0 , y: 215.0, width: 250.0, height: 400.0))
        tromboneBunny.image = UIImage(named: "t_bunny")
        tromboneBunny.contentMode = .scaleAspectFit
        self.addSubview(tromboneBunny)
        
        violinBunny = UIImageView(frame: CGRect(x: -275.0 , y: 200.0, width: 275.0, height: 400.0))
        violinBunny.image = UIImage(named: "v_bunny")
        violinBunny.contentMode = .scaleAspectFit
        self.addSubview(violinBunny)
        
        
        drumBunny = UIImageView(frame: CGRect(x: 1050.0 , y: 200.0, width: 250.0, height: 400.0))
        drumBunny.image = UIImage(named: "d_bunny")
        drumBunny.contentMode = .scaleAspectFit
        self.addSubview(drumBunny)
        
        saxphoneBunny = UIImageView(frame: CGRect(x: 1050.0 , y: 215.0, width: 250.0, height: 400.0))
        saxphoneBunny.image = UIImage(named: "s_bunny")
        saxphoneBunny.contentMode = .scaleAspectFit
        self.addSubview(saxphoneBunny)
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
            }, completion: {(finish: Bool) in UIView.animate(withDuration: 1, delay: 1.5, animations: {
                self.bandLogo.center.y = 173
                self.signature.center.y = 68
            }, completion: {(finish: Bool) in UIView.animate(withDuration: 1.5, animations: {
                self.violinBunny.center.x = 317.5
            }, completion: {(finish: Bool) in UIView.animate(withDuration: 1.5, animations: {
                self.drumBunny.center.x = 525.0
            }, completion: {(finish: Bool) in UIView.animate(withDuration: 1, animations: {
                self.tromboneBunny.center.x = 125.0
            }, completion: {(finish: Bool) in UIView.animate(withDuration: 1, animations: {
                self.saxphoneBunny.center.x = 675.0
            }, completion: nil)})})})})})})})})
        })
    }
    
    func removeSplashScreen() {
        UIView.animate(withDuration: 1, animations: {
            self.bandLogo.center.y = -128
            self.signature.center.y = -118
        }, completion: {(finish: Bool) in UIView.animate(withDuration: 0.5, animations: {
            self.tromboneBunny.center.x = -250
            self.saxphoneBunny.center.x = 1050
        }, completion: {(finish: Bool) in UIView.animate(withDuration: 0.8, animations: {
            self.violinBunny.center.x = -250
            self.drumBunny.center.x = 1050
        }, completion: nil)})})
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
