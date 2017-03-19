//
//  EditPannel.swift
//  band
//
//  Created by Isabel  Lee on 19/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import Foundation
import UIKit

class EditPannel: UIView {
    let allNotes = ["Do", "Re", "Mi", "Fa", "So", "La", "Ti", "Do_h", "Re_h", "Mi_h", "Fa_h", "So_h", "La_h", "Ti_h"]
    init(){
        super.init(frame: CGRect(x: 0.0 , y: 0.0, width: 1366.0, height: 1024.0))
        self.backgroundColor = UIColor.black
        addSlots()
        addButtons()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSlots() {
        for i in 0...12 {
            let newSlot = TromboneSlots(x: Double(i)*110.0, y: 0.0)
            newSlot.tag = i + 100
            self.addSubview(newSlot)
        }
    }
    
    func addButtons() {
        for i in 0...13 {
            let newButton = TromboneNoteButtons(name: allNotes[i], x: Double(i)*100.0, y: 900.0)
            newButton.tag = i+1
            self.addSubview(newButton)
            
        }
    }
    
    
    
}

