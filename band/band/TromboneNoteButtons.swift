//
//  TromboneNoteButtons.swift
//  band
//
//  Created by Isabel  Lee on 17/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//


import UIKit

class TromboneNoteButtons: NoteButtons {

    
    required override init(name: String, x: Double, y: Double) {
        super.init(name: name, x: x, y: y)
        self.fullName = "t_" + name
        self.image = UIImage(named: self.fullName)
        self.instrument = Instruments.Trombone
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
