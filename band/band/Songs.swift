//
//  Songs.swift
//  band
//
//  Created by Isabel  Lee on 21/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class Songs {
    
    init(){

    }
    
    func odeToJoy() -> [ComposedNotes]{
        var notes: [ComposedNotes] = []
        let tNotes = ["Mi_h", "Mi_h", "Fa_h", "So_h", "None",
                      "So_h", "Fa_h", "Mi_h", "Re_h", "None",
                      "Do_h", "Do_h", "Re_h", "Mi_h", "None",
                      "Mi_h", "None", "Re_h", "Re_h", "None"]
        let dNotes = ["single", "single", "double", "double", "None",
                      "single", "single", "double", "double", "None",
                      "single", "single", "double", "double", "None",
                      "triple", "None", "single", "single", "None"]
        let sNotes = ["Do_h", "Do_h", "Re_h", "Mi_h", "None",
                      "Mi_h", "Re_h", "Do_h", "Ti", "None",
                      "Do", "Do", "Ti", "Do_h", "None",
                      "Mi_h", "None", "Ti", "Ti", "None"]
        
//        let tNotes = ["Mi_h", "Mi_h", "Fa_h", "So_h", "None"]
//        let dNotes = ["single", "single", "double", "double", "None"]
//        let sNotes = ["Do_h", "Do_h", "Re_h", "Mi_h", "None"]
        
        for i in 0..<tNotes.count{
            let newComposedNote = ComposedNotes(tNoteName: tNotes[i], sNoteName: sNotes[i], dNoteName: dNotes[i])
            if let lastElement = notes.last {
                lastElement.next = newComposedNote
            }
            notes.append(newComposedNote)
        }
        return notes
    }
}
