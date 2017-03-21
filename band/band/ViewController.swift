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

    //let editPannel = EditPannel()
    let band = Band()
    let playButton = UIButton(frame: CGRect(x: 0.0 , y: 0.0, width: 120.0, height: 50.0))
    var notes: [ComposedNotes] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.addSubview(editPannel)
        view.addSubview(band)
        addButtons()
    }
    
    func addButtons() {
        playButton.backgroundColor = UIColor.cyan
        playButton.setTitle("Play", for: UIControlState.normal)
        playButton.addTarget(self, action: #selector(playButton(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(playButton)
        
    }
    
    func playButton(_ button: UIButton!) {
        
        notes = Songs().odeToJoy()
        notes[0].playSong()
        band.startBand()
    }
    
}

