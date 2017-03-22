//
//  NoteSlots.swift
//  band
//
//  Created by Isabel  Lee on 17/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class NoteSlots: UIImageView, UIGestureRecognizerDelegate {
    
    let noteSize = size.noteSize.rawValue
    var instrument: Instruments!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(x: Double, y: Double) {
        super.init(frame: CGRect(x: x , y: y, width: noteSize, height: noteSize))
        //self.layer.borderWidth = 2
        //self.layer.borderColor = UIColor.darkGray.cgColor
        self.instrument = Instruments.None
        self.isUserInteractionEnabled = true
    }

}
