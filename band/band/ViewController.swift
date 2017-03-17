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
    var player1: Player!
    var note: Notes?
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
        player1 = Player()
        
        
    }
    
    
    

}

