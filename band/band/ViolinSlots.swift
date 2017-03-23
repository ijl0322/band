//
//  ViolinSlots.swift
//  band
//
//  Created by Isabel  Lee on 23/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class ViolinSlots: NoteSlots {
    
    override required init(x: Double, y: Double) {
        super.init(x: x, y: y)
        self.instrument = Instruments.Violin
        self.image = UIImage(named: "v_None")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

