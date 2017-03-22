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
    let infoButton = UIButton(frame: CGRect(x: 620.0 , y: 540.0, width: 60.0, height: 60.0))
    let playButton = UIButton(frame: CGRect(x: 680.0 , y: 540.0, width: 60.0, height: 60.0))
    let clearButton = UIButton(frame: CGRect(x: 740.0 , y: 540.0, width: 60.0, height: 60.0))
    var notes: [ComposedNotes] = []
    let snowView = LightingView(frame: CGRect(x: 0, y: 0, width: 800, height: 600))
    let stage = UIImageView(frame: CGRect(x: 0, y: 0, width: 800, height: 600))

    override func viewDidLoad() {
        super.viewDidLoad()
        editPannel.composedNoteList.last?.delegate = self
        stage.image = UIImage(named: "stage")
        view.addSubview(stage)
        view.addSubview(snowView)
        view.addSubview(band)
        view.addSubview(editPannel)

        addButtons()
    }
    
    func addButtons() {
        playButton.setImage(UIImage(named: "playButton"), for: .normal)
        playButton.addTarget(self, action: #selector(playButton(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(playButton)
        
        clearButton.setImage(UIImage(named: "clearAllButton"), for: .normal)
        clearButton.addTarget(self, action: #selector(clearButton(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(clearButton)
        
        infoButton.setImage(UIImage(named: "infoButton"), for: .normal)
        infoButton.addTarget(self, action: #selector(infoButton(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(infoButton)
    }
    
    func infoButton(_ button: UIButton!) {
        print("showing info")
    }
    
    func playButton(_ button: UIButton!) {
        band.startBand()
        playButton.isEnabled = false
        self.playButton.alpha = 0.5
        self.snowView.alpha = 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.editPannel.playSong()
        }
    }
    
    func clearButton(_ button: UIButton!) {
        editPannel.clearAll()
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

