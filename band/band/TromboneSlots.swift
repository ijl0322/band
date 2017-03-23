//
//  TromboneSlots.swift
//  band
//
//  Created by Isabel  Lee on 17/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class TromboneSlots: NoteSlots {
    
    override required init(x: Double, y: Double) {
        super.init(x: x, y: y)
        self.instrument = Instruments.Trombone
        self.image = UIImage(named: "t_None")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
