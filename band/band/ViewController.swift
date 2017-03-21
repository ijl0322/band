//
//  ViewController.swift
//  band
//
//  Created by Isabel  Lee on 16/03/2017.
//  Copyright © 2017 Isabel  Lee. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, MusicStatusDelegate {

    let editPannel = EditPannel()
    let band = Band()
    let playButton = UIButton(frame: CGRect(x: 0.0 , y: 0.0, width: 120.0, height: 50.0))
    var notes: [ComposedNotes] = []
    let snowView = LightingView(frame: CGRect(x: 0, y: 0, width: 1336, height: 1024))

    override func viewDidLoad() {
        super.viewDidLoad()
        editPannel.composedNoteList.last?.delegate = self
        view.addSubview(editPannel)

        view.addSubview(snowView)
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
        band.startBand()
        playButton.isEnabled = false
        self.playButton.alpha = 0.5
        self.snowView.alpha = 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.editPannel.playSong()
        }
    }
    
    func musicEnded() {
        SharedAudioPlayer.player.playNote(name: "clapping")
        self.band.stopAllAnimation()
        UIView.animate(withDuration: 6, animations: {
            self.snowView.alpha = 0
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            self.playButton.isEnabled = true
            self.playButton.alpha = 1
        }
    }
}

