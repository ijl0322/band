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
        let newName = "t_" + name
        self.note = TromboneNotes(name: name)
        self.image = UIImage(named: newName)
        self.instrument = Instruments.Trombone
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
