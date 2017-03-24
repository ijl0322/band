//
//  ComposedNotes.swift
//  band
//
//  Created by Isabel  Lee on 18/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit

protocol MusicStatusDelegate: class {
    func musicEnded()
}

class ComposedNotes {
    weak var delegate: MusicStatusDelegate?
    var tNote: Notes
    var sNote: Notes
    var dNote: Notes
    var vNote: Notes
    var tNone = SharedNoneNote.trombone
    var sNone = SharedNoneNote.saxphone
    var dNone = SharedNoneNote.drum
    var vNone = SharedNoneNote.violin
    var next: ComposedNotes?
    
    init(tNoteName: String = "None", sNoteName: String = "None", dNoteName: String = "None", vNoteName: String = "None") {
        tNote = TromboneNotes(name: tNoteName)
        sNote = SaxphoneNotes(name: sNoteName)
        dNote = DrumNotes(name: dNoteName)
        vNote = ViolinNotes(name: vNoteName)
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
    
    func addVNote(note: String) {
        vNote = ViolinNotes(name: note)
    }
    
    func playSong() {
        tNote.playNote()
        sNote.playNote()
        dNote.playNote()
        vNote.playNote()
        if let nextNote = self.next {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15){
                print("playing next")
                nextNote.playSong()
            }
        } else {
            delegate?.musicEnded()
            print("song ended")
        }
    }
    
    func clearNote() {
        tNote = tNone
        dNote = dNone
        sNote = sNone
        vNote = vNone
    }
}
