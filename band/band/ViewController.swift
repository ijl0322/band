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
    
    @IBAction func myButton(_ sender: UIButton) {
        //note = Notes(name: "Mi")
        //note?.playNote()
        playerQueue!.play()
        playerQueue2!.play()
    }
    
    @IBOutlet weak var Me: UIImageView!
    @IBOutlet weak var Re: UIImageView!
    @IBOutlet weak var Do: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Do.isUserInteractionEnabled = true
        Re.isUserInteractionEnabled = true
        Me.isUserInteractionEnabled = true
        Do_Button = TromboneNoteButtons(name: "Do", x: 100.0, y: 100.0)
        Re_Button = TromboneNoteButtons(name: "Re", x: 150.0, y: 150.0)
        Mi_Button = TromboneNoteButtons(name: "Mi", x: 200.0, y: 200.0)
        song = [TromboneNotes(name: "Do").queuePlayerItem, TromboneNotes(name:"Re").queuePlayerItem, TromboneNotes(name: "Mi").queuePlayerItem]
        song2 = [TromboneNotes(name: "Mi").queuePlayerItem, TromboneNotes(name:"Re").queuePlayerItem, TromboneNotes(name: "Do").queuePlayerItem]
        
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

