//
//  InfoView.swift
//  band
//
//  Created by Isabel  Lee on 23/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit
class InfoView: UIView {
    
    var info1: UIImageView!
    var info2: UIImageView!
    var info3: UIImageView!
    var nextButton1: UIButton!
    var nextButton2: UIButton!
    var okButton: UIButton!
    init() {
        super.init(frame: CGRect(x: 0.0 , y: 0.0, width: size.screenWidth.rawValue, height: size.screenHeight.rawValue))
        setUp()
    }
    
    func setUp() {
        self.info1 = UIImageView(frame: CGRect(x: 0.0 , y: 0.0, width: size.screenWidth.rawValue, height: size.screenHeight.rawValue))
        self.info1.image = UIImage(named: "info1")
        self.info1.isUserInteractionEnabled = true
        
        self.info2 = UIImageView(frame: CGRect(x: 0.0 , y: 0.0, width: size.screenWidth.rawValue, height: size.screenHeight.rawValue))
        self.info2.image = UIImage(named: "info2")
        self.info2.isUserInteractionEnabled = true
        
        self.info3 = UIImageView(frame: CGRect(x: 0.0 , y: 0.0, width: size.screenWidth.rawValue, height: size.screenHeight.rawValue))
        self.info3.image = UIImage(named: "info3")
        self.info3.isUserInteractionEnabled = true
        
        self.nextButton1 = UIButton(frame: CGRect(x: 690.0 , y: 525.0, width: 77, height: 44))
        self.nextButton1.addTarget(self, action: #selector(buttonTapped), for: UIControlEvents.touchUpInside)
        self.nextButton1.tag = 1
        self.nextButton1.setImage(UIImage(named: "nextButton"), for: .normal)
        
        self.nextButton2 = UIButton(frame: CGRect(x: 690.0 , y: 525.0, width: 77, height: 44))
        self.nextButton2.addTarget(self, action: #selector(buttonTapped), for: UIControlEvents.touchUpInside)
        self.nextButton2.tag = 2
        self.nextButton2.setImage(UIImage(named: "nextButton"), for: .normal)
        
        self.okButton = UIButton(frame: CGRect(x: 690.0 , y: 525.0, width: 77, height: 44))
        self.okButton.addTarget(self, action: #selector(buttonTapped), for: UIControlEvents.touchUpInside)
        self.okButton.tag = 3
        self.okButton.setImage(UIImage(named: "okButton"), for: .normal)
        
        self.info1.addSubview(nextButton1)
        self.info2.addSubview(nextButton2)
        self.info3.addSubview(okButton)
    }

    func buttonTapped(_ button: UIButton!) {
        switch button.tag {
        case 1:
            info1.removeFromSuperview()
            break
        case 2:
            info2.removeFromSuperview()
            break
        case 3:
            info3.removeFromSuperview()
            self.removeFromSuperview()
            break
        default:
            break
        }
    }
    
    func showInfo() {
        self.addSubview(info3)
        self.addSubview(info2)
        self.addSubview(info1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
