//
//  ComposedNotes.swift
//  band
//
//  Created by Isabel  Lee on 18/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

class ComposedNotes {
    var tNote: Notes
    var sNote: Notes
    var dNote: Notes
    var tNone = TromboneNotes(name: "None")
    var sNone = SaxphoneNotes(name: "None")
    var dNone = DrumNotes(name: "None")
    var next: ComposedNotes?
    
    init(tNoteName: String = "None", sNoteName: String = "None", dNoteName: String = "None") {
        tNote = TromboneNotes(name: tNoteName)
        sNote = SaxphoneNotes(name: sNoteName)
        dNote = DrumNotes(name: dNoteName)
    }
    
    func addTNote(note: String) {
        tNote = TromboneNotes(name: note)
    }
    
    func addSNote(note: String) {
        sNote = SaxphoneNotes(name: note)
    }
    
    func addDNote(note: String) {
        dNote = DrumNotes(name: note)
    }
    
    func playSong() {
        tNote.playNote()
        sNote.playNote()
        dNote.playNote()
        if let nextNote = self.next {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15){
                print("playing next")
                nextNote.playSong()
            }
        }
    }
    
    func clearNote() {
        tNote = tNone
        dNote = dNone
        sNote = sNone
    }
}
