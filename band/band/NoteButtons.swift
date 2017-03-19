//
//  NoteButtons.swift
//  band
//
//  Created by Isabel  Lee on 16/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit
class NoteButtons: UIImageView, UIGestureRecognizerDelegate {
    let size = 100.0
    var note: Notes!
    var instrument: Instruments!
    var name: String!
    var fullName: String!
    var originalX: Double!
    var originalY: Double!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(name: String, x: Double, y: Double) {
        super.init(frame: CGRect(x: x , y: y, width: size, height: size))
        self.fullName = name
        self.name = name
        self.isUserInteractionEnabled = true
        self.instrument = Instruments.None
        self.originalX = x + size/2
        self.originalY = y + size/2
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tapGestureRecognizer.delegate = self
        self.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    func handleTap(_: UITapGestureRecognizer){
        self.note.playNote()
    }
    
}
