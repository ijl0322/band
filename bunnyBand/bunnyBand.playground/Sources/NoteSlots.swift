//
//  NoteSlots.swift
//  band
//
//  Created by Isabel  Lee on 17/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class NoteSlots: UIImageView, UIGestureRecognizerDelegate {
    
    let size = 50.0
    var instrument: Instruments!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(x: Double, y: Double) {
        super.init(frame: CGRect(x: x , y: y, width: size, height: size))
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.instrument = Instruments.None
        self.isUserInteractionEnabled = true
    }

}
