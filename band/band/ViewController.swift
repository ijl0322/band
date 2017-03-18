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
    var playerQueue: AVQueuePlayer?
    var playerQueue2: AVQueuePlayer?
    var song: [AVPlayerItem] = []
    var song2: [AVPlayerItem] = []
    let Do = TromboneNotes(name: "Do").queuePlayerItem
    let Re = TromboneNotes(name: "Re").queuePlayerItem
    let Mi = TromboneNotes(name: "Mi").queuePlayerItem
    let Fa = TromboneNotes(name: "Fa").queuePlayerItem
    let So = TromboneNotes(name: "So").queuePlayerItem
    let La = TromboneNotes(name: "La").queuePlayerItem
    let Ti = TromboneNotes(name: "Ti").queuePlayerItem
    let Do_h = TromboneNotes(name: "Do_h").queuePlayerItem
    let Re_h = TromboneNotes(name: "Re_h").queuePlayerItem
    let Mi_h = TromboneNotes(name: "Mi_h").queuePlayerItem
    let Fa_h = TromboneNotes(name: "Fa_h").queuePlayerItem
    let So_h = TromboneNotes(name: "So_h").queuePlayerItem
    let La_h = TromboneNotes(name: "La_h").queuePlayerItem
    let Ti_h = TromboneNotes(name: "Ti_h").queuePlayerItem
    
    
    @IBAction func myButton(_ sender: UIButton) {
        playerQueue!.play()
        playerQueue2!.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Do_Button = TromboneNoteButtons(name: "Do", x: 100.0, y: 100.0)
        Re_Button = TromboneNoteButtons(name: "Re", x: 150.0, y: 150.0)
        Mi_Button = TromboneNoteButtons(name: "Mi", x: 200.0, y: 200.0)
        song = [TromboneNotes(name: "Mi").queuePlayerItem, TromboneNotes(name: "Mi").queuePlayerItem, TromboneNotes(name: "Fa").queuePlayerItem, TromboneNotes(name: "So").queuePlayerItem, TromboneNotes(name: "So").queuePlayerItem, TromboneNotes(name: "Fa").queuePlayerItem, TromboneNotes(name: "Mi").queuePlayerItem, TromboneNotes(name: "Re").queuePlayerItem, TromboneNotes(name: "Do").queuePlayerItem, TromboneNotes(name: "Do").queuePlayerItem, TromboneNotes(name: "Re").queuePlayerItem, TromboneNotes(name: "Mi").queuePlayerItem, TromboneNotes(name: "Mi").queuePlayerItem, TromboneNotes(name: "Re").queuePlayerItem, TromboneNotes(name: "Re").queuePlayerItem]
        song2 = [TromboneNotes(name: "Do").queuePlayerItem, TromboneNotes(name:"Do").queuePlayerItem, TromboneNotes(name: "Re").queuePlayerItem, TromboneNotes(name: "Mi").queuePlayerItem, TromboneNotes(name: "Mi").queuePlayerItem, TromboneNotes(name: "Re").queuePlayerItem, TromboneNotes(name:"Do").queuePlayerItem, TromboneNotes(name: "Re").queuePlayerItem, TromboneNotes(name: "Do").queuePlayerItem, TromboneNotes(name:"Do").queuePlayerItem,TromboneNotes(name: "Re").queuePlayerItem, TromboneNotes(name: "Mi").queuePlayerItem, TromboneNotes(name:"Do").queuePlayerItem, TromboneNotes(name: "Re").queuePlayerItem, TromboneNotes(name: "Re").queuePlayerItem]
        
        tromboneSlot = TromboneSlots(x: 200.0, y: 200.0)
        tromboneSlot?.tag = 1
        
        playerQueue = {

            let queue = AVQueuePlayer(items: song)
            return queue
        }()
        
        playerQueue2 = {
            
            let queue = AVQueuePlayer(items: song2)
            return queue
        }()
        
        view.addSubview(tromboneSlot!)
        view.addSubview(Do_Button!)
        view.addSubview(Re_Button!)
        view.addSubview(Mi_Button!)
    }

}

