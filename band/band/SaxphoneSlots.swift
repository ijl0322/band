//
//  SaxphoneSlots.swift
//  band
//
//  Created by Isabel  Lee on 19/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class SaxphoneSlots: NoteSlots {
    
    let green = UIColor(red: 184/255, green: 237/255, blue: 111/255, alpha: 1)
    override required init(x: Double, y: Double) {
        super.init(x: x, y: y)
        self.backgroundColor = green
        self.instrument = Instruments.Saxphone
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

