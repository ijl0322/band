//
//  SaxphoneNoteButtons.swift
//  band
//
//  Created by Isabel  Lee on 19/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class SaxphoneNoteButtons: NoteButtons {
    
    
    required override init(name: String, x: Double, y: Double) {
        super.init(name: name, x: x, y: y)
        self.fullName = "Saxphone/s_" + name
        self.note = SaxphoneNotes(name: name)
        self.image = UIImage(named: self.fullName)
        self.instrument = Instruments.Saxphone
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
