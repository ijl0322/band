//
//  ComposedNotes.swift
//  band
//
//  Created by Isabel  Lee on 18/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import Foundation
import UIKit


//Need to change S note to Saxphone, D to Drum
class ComposedNotes {
    var tNote: Notes
    var sNote: Notes
    var dNote: Notes
    var next: ComposedNotes?
    
    init(tNoteName: String = "None", sNoteName: String = "None", dNoteName: String = "None") {
        tNote = TromboneNotes(name: tNoteName)
        sNote = TromboneNotes(name: sNoteName)
        dNote = TromboneNotes(name: dNoteName)
    }
    
    func addTNote(note: String) {
        tNote = TromboneNotes(name: note)
    }
    
    func addCNote(note: String) {
        sNote = TromboneNotes(name: note)
    }
    
    func addDNote(note: String) {
        dNote = TromboneNotes(name: note)
    }
    
    func playSong() {
        tNote.playNote()
        sNote.playNote()
        if let nextNote = self.next {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6){
                print("playing next")
                nextNote.playSong()
            }
        }
    }
}
