//
//  TromboneSlots.swift
//  band
//
//  Created by Isabel  Lee on 17/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class TromboneSlots: NoteSlots {
    
    let babyBlue = UIColor(red: 201/255, green: 245/255, blue: 252/255, alpha: 1)
    override required init(x: Double, y: Double) {
        super.init(x: x, y: y)
        self.backgroundColor = babyBlue
        self.instrument = Instruments.Trombone
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
