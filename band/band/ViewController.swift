//
//  ViewController.swift
//  band
//
//  Created by Isabel  Lee on 16/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var note: Notes?
    var Do_Button: NoteButtons?
    var Re_Button: NoteButtons?
    var Mi_Button: NoteButtons?
    var tromboneSlot: TromboneSlots?
    let Do = TromboneNotes(name: "Do")
    let Re = TromboneNotes(name: "Re")
    let Mi = TromboneNotes(name: "Mi")
    let Fa = TromboneNotes(name: "Fa")
    let So = TromboneNotes(name: "So")
    let La = TromboneNotes(name: "La")
    let Ti = TromboneNotes(name: "Ti")
    let Do_h = TromboneNotes(name: "Do_h")
    let Re_h = TromboneNotes(name: "Re_h")
    let Mi_h = TromboneNotes(name: "Mi_h")
    let Fa_h = TromboneNotes(name: "Fa_h")
    let So_h = TromboneNotes(name: "So_h")
    let La_h = TromboneNotes(name: "La_h")
    let Ti_h = TromboneNotes(name: "Ti_h")
    let composeNote = ComposedNotes(tNoteName: "Re", sNoteName: "Fa")
    let editPannel = EditPannel()
    
    @IBAction func myButton(_ sender: UIButton) {
        composeNote.playSong()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Do_Button = TromboneNoteButtons(name: "Do", x: 100.0, y: 100.0)
        Re_Button = TromboneNoteButtons(name: "Re", x: 150.0, y: 150.0)
        Mi_Button = TromboneNoteButtons(name: "Mi", x: 200.0, y: 200.0)

        
        tromboneSlot = TromboneSlots(x: 200.0, y: 200.0)
        //tromboneSlot?.tag = 1
        composeNote.next = ComposedNotes(tNoteName: "Do", sNoteName: "Mi")
        
        view.addSubview(editPannel)
        view.addSubview(tromboneSlot!)
        view.addSubview(Do_Button!)
        view.addSubview(Re_Button!)
        view.addSubview(Mi_Button!)
    }
    
    
}

