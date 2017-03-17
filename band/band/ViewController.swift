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
    var D_ap:AVAudioPlayer!
    var note: Notes?
//    var Do_note = Notes(name: "Do")
//    var Re_note = Notes(name: "Re")
//    var Mi_note = Notes(name: "Mi")
    var Do_Button: NoteButtons?
    var Re_Button: NoteButtons?
    var Mi_Button: NoteButtons?
    
    @IBAction func myButton(_ sender: UIButton) {
        note = Notes(name: "Mi")
        note?.playNote()
    }
    
    @IBOutlet weak var Me: UIImageView!
    @IBOutlet weak var Re: UIImageView!
    @IBOutlet weak var Do: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Do.isUserInteractionEnabled = true
        Re.isUserInteractionEnabled = true
        Me.isUserInteractionEnabled = true
        Do_Button = NoteButtons(name: "Do", x: 100.0, y: 100.0)
        Re_Button = NoteButtons(name: "Re", x: 150.0, y: 150.0)
        Mi_Button = NoteButtons(name: "Mi", x: 200.0, y: 200.0)
        
        view.addSubview(Do_Button!)
        view.addSubview(Re_Button!)
        view.addSubview(Mi_Button!)
    }

}

