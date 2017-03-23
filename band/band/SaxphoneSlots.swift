//
//  SaxphoneSlots.swift
//  band
//
//  Created by Isabel  Lee on 19/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class SaxphoneSlots: NoteSlots {
    
    override required init(x: Double, y: Double) {
        super.init(x: x, y: y)
        self.instrument = Instruments.Saxphone
        self.image = UIImage(named: "s_None")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

